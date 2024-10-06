provider "mgc" {
  region = "br-se1"
}

resource "random_string" "sufix" {
  length  = 6
  special = false
}


module "instance" {
  source         = "../../"
  create         = true
  name           = "${var.name}-${random_string.sufix.id}"
  ssh_key_create = true
  ssh_key_name   = "${var.name}-${random_string.sufix.id}"
  additional_disk = {
    vdb = {
      name = "opt"
      size = 10
      type = "cloud_nvme5k"
    },
    vdc = {
      name = "tmp"
      size = 10
      type = "cloud_nvme5k"
    }
  }
}