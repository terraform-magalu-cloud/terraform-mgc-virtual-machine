provider "mgc" {
  region = "br-ne1"
}

terraform {
  required_providers {
    mgc = {
      source  = "MagaluCloud/mgc"
      version = "0.18.10"
    }
  }
}

module "instance" {
  source       = "../"
  create       = true
  name         = "minha_vm"
  ssh_key_name = "key-example"
  additional_disk = {
    vdb = {
      name = "opt"
      size = 10
      type = "cloud_nvme1k"
    },
    vdc = {
      name = "tmp"
      size = 10
      type = "cloud_nvme1k"
    }
  }
  user_data = file("user-data.sh")
}

output "id" {
  value = module.instance.instance_id
}

output "associate_public_ip" {
  value = module.instance.associate_public_ip

}