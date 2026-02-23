provider "mgc" {
  api_key = var.api_key
  region  = var.region
}

resource "random_string" "sufix" {
  length  = 6
  special = false
}


module "instance" {
  source            = "../../"
  create            = true
  name              = "${var.name}-${random_string.sufix.id}"
  ssh_key_create    = false
  ssh_key_name      = "key-example"
  machine_type_name = "cloud-bs1.xsmall"
}
