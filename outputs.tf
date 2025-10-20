output "created_at" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "Creation date and time of the first virtual machine instance."
  value       = try(mgc_virtual_machine_instances.this[0].created_at, null)
}

output "id" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "ID of the first created virtual machine instance."
  value       = try(mgc_virtual_machine_instances.this[0].id, null)
}

output "image_name" {
  depends_on  = [data.mgc_virtual_machine_instance.instance]
  description = "Name of the first virtual machine instance."
  value       = try(data.mgc_virtual_machine_instance.instance.image_name, null)
}

output "image_platform" {
  depends_on  = [data.mgc_virtual_machine_instance.instance]
  description = "Name of the first virtual machine instance."
  value       = try(data.mgc_virtual_machine_instance.instance.image_platform, null)
}

output "interface_primary" {
  description = "Inform whether the interface used is the primary one"
  value       = try(mgc_virtual_machine_instances.this[0].network_interfaces[0].name, null)
}

output "machine_type" {
  depends_on  = [data.mgc_virtual_machine_instance.instance]
  description = "Name of the first virtual machine instance."
  value       = try(data.mgc_virtual_machine_instance.instance.machine_type_name, null)
}

output "name" {
  description = "Name of the first virtual machine instance."
  value       = try(mgc_virtual_machine_instances.this[0].name, null)
}

output "network_interface" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "ID of the first network interface of the first virtual machine instance."
  value       = try(mgc_virtual_machine_instances.this[0].network_interfaces[0].id, null)
}

output "network_name" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "Name of the first network interface of the first virtual machine instance"
  value       = try(mgc_virtual_machine_instances.this[0].network_interfaces[0].name, null)
}

output "private_ipv4" {
  description = "Private IPv4 address of the first network interface of the first virtual machine instance."
  value       = try(mgc_virtual_machine_instances.this[0].network_interfaces[0].local_ipv4, null)
}

output "private_ipv6" {
  description = "Private IPv6 address of the first network interface of the first virtual machine instance."
  value       = try(mgc_virtual_machine_instances.this[0].network_interfaces[0].ipv6, null)
}

output "private_key" {
  description = "TLS private key of the first virtual machine instance."
  value       = try(tls_private_key.ssh_key[0].private_key_openssh, null)
  sensitive   = true
}

output "public_ipv4" {
  description = "Public IPv4 address of the first network interface of the first virtual machine instance."
  value       = try(mgc_virtual_machine_instances.this[0].network_interfaces[0].ipv4, null)
}

output "public_key" {
  description = "Public key of the first virtual machine instance."
  value       = try(tls_private_key.ssh_key[0].public_key_openssh, null)
  sensitive   = false
}

output "security_group_ids" {
  description = "List of security group IDs associated with the first virtual machine instance."
  value       = local.resulting_security_group_ids
}

output "security_group_names" {
  description = "List of security group IDs associated with the first virtual machine instance."
  value       = var.security_group_names
}

output "ssh_key_name" {
  description = "Name of the first virtual machine instance."
  value       = try(mgc_virtual_machine_instances.this[0].ssh_key_name, null)
}

output "vpc_id" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "ID of the VPC used by the first virtual machine instance."
  value       = try(mgc_virtual_machine_instances.this[0].vpc_id, null)
}