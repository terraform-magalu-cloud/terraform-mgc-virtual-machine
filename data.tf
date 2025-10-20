data "mgc_network_vpcs" "this" {
}

data "mgc_network_security_groups" "this" {
}

data "mgc_virtual_machine_instance" "instance" {
  id = mgc_virtual_machine_instances.this[0].id
}