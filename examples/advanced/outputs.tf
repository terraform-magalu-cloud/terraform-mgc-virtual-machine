output "instance_id" {
  description = "ID of the macine"
  value       = module.instance.id
}

output "instance_associate_public_ip" {
  description = "If machine has ip public, boolean"
  value       = module.instance.public_ipv4

}
