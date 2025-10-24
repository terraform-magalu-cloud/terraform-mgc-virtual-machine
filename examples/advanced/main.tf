provider "mgc" {
  region  = var.region
  api_key = var.api_key
}

resource "random_string" "sufix" {
  length  = 6
  special = false
}


module "instance_first" {
  source                = "../../"
  create                = true
  name                  = "first-${var.name}-${random_string.sufix.id}"
  ssh_key_create        = true
  ssh_key_name          = "first-${var.name}-${random_string.sufix.id}"
  attach_public_ip      = true
  backup_enabled        = true
  backup_retention_days = 7
  backup_schedule       = "03:00:00"
  vpc_name              = "vpc_default"
  machine_type_name     = "BV2-2-10"
  #image_name            = "cloud-ubuntu-24.04 LTS"
  create_from_snapshot_id = "12586af7-43d6-4229-9b29-2a93bd7d429b"
  additional_disk = {
    vdb = {
      name      = "opt"
      size      = 10
      type      = "cloud_nvme5k"
      encrypted = false
    },
    vdc = {
      name      = "tmp"
      size      = 10
      type      = "cloud_nvme5k"
      encrypted = false
    }
  }
  security_group_names = ["panda-pub-party", "example-security-group", "sg-example-akSdVhOR"]
}

module "instance_second" {
  source                = "../../"
  create                = true
  name                  = "second-${var.name}-${random_string.sufix.id}"
  ssh_key_create        = true
  ssh_key_name          = "second-${var.name}-${random_string.sufix.id}"
  attach_public_ip      = true
  backup_enabled        = true
  backup_retention_days = 7
  backup_schedule       = "03:00:00"
  vpc_name              = "vpc_default"
  machine_type_name     = "BV2-2-10"
  image_name            = "cloud-ubuntu-24.04 LTS"
  #create_from_snapshot_id = "12586af7-43d6-4229-9b29-2a93bd7d429b"
  additional_disk = {
    vdb = {
      name      = "opt"
      size      = 10
      type      = "cloud_nvme5k"
      encrypted = false
    },
    vdc = {
      name      = "tmp"
      size      = 10
      type      = "cloud_nvme5k"
      encrypted = false
    }
  }
  #security_group_names = ["panda-pub-party", "example-security-group", "sg-example-akSdVhOR"]
}