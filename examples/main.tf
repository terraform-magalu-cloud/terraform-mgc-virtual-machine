provider "mgc" {
  region = "br-ne1"
}

module "instance" {
  source       = "../"
  create       = true
  name         = var.name
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

