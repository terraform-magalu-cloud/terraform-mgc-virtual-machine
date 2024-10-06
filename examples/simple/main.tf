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
  ssh_key_create = false
  ssh_key_name   = "key-example"
}
