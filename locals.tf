locals {
  vpc_default_id = try(
    [for vpc in data.mgc_network_vpcs.this.items : vpc.id if vpc.name == var.vpc_name][0],
    null
  )
  sg_name_to_id_map = {
    for sg in data.mgc_network_security_groups.this.items : sg.name => sg.id
  }
  resulting_security_group_ids = var.security_group_names != [] ? compact([
    for sg_name in var.security_group_names : lookup(local.sg_name_to_id_map, sg_name, null)
  ]) : []
}