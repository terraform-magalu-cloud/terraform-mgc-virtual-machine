provider "mgc" {
  alias  = "ne"
  region = "br-ne1"
}

provider "mgc" {
  alias  = "se"
  region = "br-se1"
}

resource "random_string" "sufix_ne" {
  length  = 6
  special = false
}

resource "random_string" "sufix_se" {
  length  = 6
  special = false
}


module "instance_ne" {
  providers = {
    mgc = mgc.ne
  }
  source       = "../"
  create       = true
  name         = "${var.name}-ne-${random_string.sufix_ne.id}"
  ssh_key_name = "key-example"
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
  user_data = file("user-data.sh")
}

module "instance_se" {
  providers = {
    mgc = mgc.se
  }
  source       = "../"
  create       = true
  name         = "${var.name}-se-${random_string.sufix_se.id}"
  ssh_key_name = "key-example"
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
  user_data = file("user-data.sh")
}

