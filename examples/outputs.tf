output "instance_ne_id" {
  description = "ID of the macine"
  value       = module.instance_ne.instance_id
}

output "instance_ne_associate_public_ip" {
  description = "If machine has ip public, boolean"
  value       = module.instance_ne.associate_public_ip

}


output "instance_se_id" {
  description = "ID of the macine"
  value       = module.instance_se.instance_id
}

output "instance_se_associate_public_ip" {
  description = "If machine has ip public, boolean"
  value       = module.instance_se.associate_public_ip
}
