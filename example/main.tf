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
  name         = "minha_vm"
  ssh_key_name = "key-opensuse"
}

output "id" {
  value = module.instance.instance_id
}