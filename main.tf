resource "random_string" "this" {
  count   = length(var.name) > 0 ? 0 : 1
  length  = 8
  special = false
  keepers = {
    name = var.name
  }
}

resource "random_pet" "this" {
  count     = length(var.name) > 0 ? 0 : 1
  length    = 1
  separator = "-"
  keepers = {
    name = var.name
  }
}

resource "tls_private_key" "ssh_key" {
  count     = var.ssh_key_create ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_key" {
  count    = var.ssh_key_create ? 1 : 0
  content  = tls_private_key.ssh_key[0].public_key_openssh
  filename = "./${var.ssh_key_name}_ssh.pub"
}

resource "local_sensitive_file" "ssh_key" {
  count    = var.ssh_key_create ? 1 : 0
  content  = tls_private_key.ssh_key[0].private_key_openssh
  filename = "./${var.ssh_key_name}_ssh.key"
}

resource "mgc_ssh_keys" "ssh_key" {
  depends_on = [tls_private_key.ssh_key, local_file.ssh_key, local_sensitive_file.ssh_key]
  count      = var.ssh_key_create ? 1 : 0
  name       = length(var.ssh_key_name) > 0 ? var.ssh_key_name : "${resource.random_pet.this[0].id}-${resource.random_string.this[0].id}"
  key        = tls_private_key.ssh_key[0].public_key_openssh
}

resource "mgc_virtual_machine_instances" "this" {
  depends_on               = [random_pet.this, random_string.this, tls_private_key.ssh_key, mgc_ssh_keys.ssh_key, local.resulting_security_group_ids]
  count                    = var.create ? 1 : 0
  ssh_key_name             = length(var.ssh_key_name) > 0 ? var.ssh_key_name : ""
  name                     = length(var.name) > 0 ? lower(var.name) : lower("${resource.random_pet.this[0].id}-${resource.random_string.this[0].id}")
  machine_type             = var.machine_type_name
  image                    = var.create_from_snapshot_id == null ? var.image_name : null
  availability_zone        = length(var.availability_zone) > 0 ? var.availability_zone : null
  user_data                = length(var.user_data) > 0 ? base64encode(var.user_data) : null
  vpc_id                   = local.vpc_default_id
  allocate_public_ipv4     = var.attach_public_ip
  creation_security_groups = length(local.resulting_security_group_ids) > 0 ? toset(sort(local.resulting_security_group_ids)) : null
  snapshot_id              = var.create_from_snapshot_id != null ? var.create_from_snapshot_id : null
}

resource "mgc_block_storage_volumes" "this" {
  depends_on        = [mgc_virtual_machine_instances.this]
  for_each          = var.create && length(var.additional_disk) > 0 ? var.additional_disk : {}
  name              = "${mgc_virtual_machine_instances.this[0].name}-${each.value.name}"
  size              = try(each.value.size, 10)
  type              = var.disk_type
  availability_zone = length(var.availability_zone) > 0 ? var.availability_zone : null
  encrypted         = try(each.value.encrypted, false)
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [mgc_virtual_machine_instances.this, mgc_block_storage_volumes.this]
  count      = var.create ? 1 : 0

  create_duration  = "30s"
  destroy_duration = "30s"
  triggers = {
    volume_qtd = length(var.additional_disk)
  }
}

resource "mgc_block_storage_volume_attachment" "this" {
  depends_on         = [mgc_virtual_machine_instances.this, mgc_block_storage_volumes.this, time_sleep.wait_30_seconds]
  for_each           = var.create && length(var.additional_disk) > 0 ? var.additional_disk : {}
  virtual_machine_id = mgc_virtual_machine_instances.this[0].id
  block_storage_id   = mgc_block_storage_volumes.this[each.key].id
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_string" "sufix_backup" {
  count       = var.create && var.backup_enabled ? 1 : 0
  length      = 8
  special     = false
  min_lower   = 2
  min_numeric = 2
  upper       = false
}

resource "mgc_block_storage_schedule" "default_backup" {
  count                             = var.backup_enabled ? 1 : 0
  name                              = "default-backup-schedule-${random_string.sufix_backup[0].id}"
  description                       = "Backup schedule from ${mgc_virtual_machine_instances.this[0].name}"
  snapshot_type                     = "instant"
  policy_retention_in_days          = var.backup_retention_days
  policy_frequency_daily_start_time = var.backup_schedule
}

resource "mgc_block_storage_schedule_attach" "default_backup" {
  depends_on  = [mgc_block_storage_schedule.default_backup, mgc_block_storage_volumes.this]
  for_each    = var.backup_enabled && length(var.additional_disk) > 0 ? tomap(var.additional_disk) : {}
  schedule_id = mgc_block_storage_schedule.default_backup[0].id
  volume_id   = mgc_block_storage_volumes.this[each.key].id
}