provider "mgc" {
  region = "br-ne1"
}

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

resource "mgc_virtual-machine_instances" "this" {
  count        = var.create ? 1 : 0
  ssh_key_name = var.ssh_key_name
  name         = length(var.name) > 0 ? var.name : "${resource.random_pet.this[0].id}-${resource.random_string.this[0].id}"
  image = {
    name = var.image_name
  }
  machine_type = {
    name = var.machine_type_name
  }
  delete_public_ip = var.delete_public_ip_on_destroy
  network = {
    associate_public_ip = var.associate_public_ip
    vpc = {
      name = var.network_name
    }
  }
  user_data = length(var.user_data) > 0 ? base64encode(var.user_data) : null
}

resource "mgc_block-storage_volumes" "this" {
  depends_on = [mgc_virtual-machine_instances.this]
  for_each   = var.create && length(var.additional_disk) > 0 ? var.additional_disk : {}
  name       = "${mgc_virtual-machine_instances.this[0].current_name}-${each.value.name}"
  size       = each.value.size
  type = {
    name = each.value.type
  }
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [mgc_virtual-machine_instances.this, mgc_block-storage_volumes.this]

  create_duration  = "30s"
  destroy_duration = "30s"
  triggers = {
    id = timestamp()
  }
}

resource "mgc_block-storage_volume-attachment" "this" {
  depends_on         = [time_sleep.wait_30_seconds, mgc_block-storage_volumes.this, mgc_virtual-machine_instances.this]
  for_each           = var.create && length(var.additional_disk) > 0 ? var.additional_disk : {}
  virtual_machine_id = mgc_virtual-machine_instances.this[0].id
  block_storage_id   = mgc_block-storage_volumes.this[each.key].id
}