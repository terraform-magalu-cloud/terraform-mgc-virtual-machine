resource "random_string" "this" {
  count   = length(var.name) > 0 ? 0 : 1
  length  = 8
  special = false
}

resource "random_pet" "this" {
  count     = length(var.name) > 0 ? 0 : 1
  length    = 1
  separator = "-"
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
  depends_on = [tls_private_key.ssh_key]
  count      = var.ssh_key_create ? 1 : 0
  name       = length(var.ssh_key_name) > 0 ? var.ssh_key_name : "${resource.random_pet.this[0].id}-${resource.random_string.this[0].id}"
  key        = tls_private_key.ssh_key[0].public_key_openssh
}

resource "mgc_virtual_machine_instances" "this" {
  depends_on     = [random_pet.this, random_string.this, tls_private_key.ssh_key, mgc_ssh_keys.ssh_key]
  count          = var.create ? 1 : 0
  name_is_prefix = var.name_is_prefix
  ssh_key_name   = var.ssh_key_name
  name           = length(var.name) > 0 ? lower(var.name) : lower("${resource.random_pet.this[0].id}-${resource.random_string.this[0].id}")
  image = {
    name = var.image_name
  }
  machine_type = {
    name = var.machine_type_name
  }
  network = {
    associate_public_ip = var.associate_public_ip
    delete_public_ip    = var.delete_public_ip_on_destroy

    vpc = {
      name = var.network_name
    }
  }
  # user_data = length(var.user_data) > 0 ? base64encode(var.user_data) : null
}

resource "mgc_block_storage_volumes" "this" {
  depends_on = [mgc_virtual_machine_instances.this]
  for_each   = var.create && length(var.additional_disk) > 0 ? var.additional_disk : {}
  name       = "${mgc_virtual_machine_instances.this[0].name}-${each.value.name}"
  size       = try(each.value.size, 10)
  type = {
    name = try(each.value.type, "cloud_nvme5k")
  }
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
