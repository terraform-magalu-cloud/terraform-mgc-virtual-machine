output "vpc_id" {
  description = "ID of the VPC used by the first virtual machine instance."
  value       = module.instance.vpc_id
}

output "security_group_ids" {
  description = "List of security group IDs associated with the first virtual machine instance."
  value       = module.instance.security_group_ids
}

output "private_ipv4" {
  description = "Private IPv4 address of the first network interface of the first virtual machine instance."
  value       = module.instance.private_ipv4
}

output "public_ipv4" {
  description = "Public IPv4 address of the first network interface of the first virtual machine instance."
  value       = module.instance.public_ipv4
}

output "private_ipv6" {
  description = "Private IPv6 address of the first network interface of the first virtual machine instance."
  value       = module.instance.private_ipv6
}

output "id" {
  description = "ID of the first created virtual machine instance."
  value       = module.instance.id
}

output "network_name" {
  description = "Name of the first network interface of the first virtual machine instance."
  value       = module.instance.network_name
}

output "public_key" {
  description = "Public key of the first virtual machine instance."
  value       = module.instance.public_key
  sensitive   = false
}

output "private_key" {
  description = "Private key of the first virtual machine instance."
  value       = module.instance.private_key
  sensitive   = true
}

output "vm_instances" {
  description = "Information about the first virtual machine instance."
  value       = data.mgc_virtual_machine_instance.identificador
}