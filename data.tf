data "mgc_virtual_machine_instance" "this" {
  depends_on = [mgc_virtual_machine_instances.this]
  id         = mgc_virtual_machine_instances.this[0].id
}