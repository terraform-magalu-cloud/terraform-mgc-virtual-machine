locals {
  vpc_found_by_name = try(
    [for vpc in data.mgc_network_vpcs.this.items : vpc.id if vpc.name == var.vpc_name][0],
    null
  )
  vpc_default_id = var.vpc_id != null && var.vpc_id != "" ? var.vpc_id : local.vpc_found_by_name

  sg_name_to_id_map = {
    for sg in data.mgc_network_security_groups.this.items : sg.name => sg.id
  }
  sg_ids_from_names = var.security_group_names != [] ? compact([
    for sg_name in var.security_group_names : lookup(local.sg_name_to_id_map, sg_name, null)
  ]) : []
  resulting_security_group_ids = distinct(compact(concat(var.security_group_ids, local.sg_ids_from_names)))
}