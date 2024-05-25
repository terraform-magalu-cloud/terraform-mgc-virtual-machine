output "id" {
  description = "ID of the macine"
  value       = module.instance.instance_id
}

output "associate_public_ip" {
  description = "If machine has ip public, boolean"
  value       = module.instance.associate_public_ip

}