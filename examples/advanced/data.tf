data "mgc_virtual_machine_instance" "first" {
  id = module.instance_first.id
}

data "mgc_virtual_machine_snapshots" "snaps" {
}