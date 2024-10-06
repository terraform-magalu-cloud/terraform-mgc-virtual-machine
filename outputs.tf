output "created_at" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "Timestamp of when the virtual machine was created"
  value       = try(resource.mgc_virtual_machine_instances.this[0].created_at, null)
}

output "id" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "ID of the created virtual machine"
  value       = try(resource.mgc_virtual_machine_instances.this[0].id, null)
}

output "status" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "Status of the virtual machine created, running, stopped, etc."
  value       = try(resource.mgc_virtual_machine_instances.this[0].status, null)
}

output "updated_at" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "Timestamp of last modified virtual machine"
  value       = try(resource.mgc_virtual_machine_instances.this[0].updated_at, null)
}

output "name" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "Virtual machine name"
  value       = try(data.mgc_virtual_machine_instance.this.image_id, null)
}

output "associate_public_ip" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "Boolean value, whether there is a public IP or not: true or false"
  value       = try(resource.mgc_virtual_machine_instances.this[0].network.associate_public_ip, null)
}

output "vpc" {
  depends_on  = [mgc_virtual_machine_instances.this]
  description = "VPC being used by the virtual machine"
  value       = try(resource.mgc_virtual_machine_instances.this[0].network.vpc, null)
}

output "public_ipv4" {
  description = "Public IPV4"
  value       = data.mgc_virtual_machine_instance.this.public_ipv4
}



output "private_ipv4" {
  description = "Private IPV4"
  value       = data.mgc_virtual_machine_instance.this.private_ipv4
}

output "public_ipv6" {
  description = "Public IPV6"
  value       = data.mgc_virtual_machine_instance.this.public_ipv6
}

output "state" {
  description = "State of instance"
  value       = data.mgc_virtual_machine_instance.this.state
}

output "image_id" {
  description = " Image ID of instance"
  value       = data.mgc_virtual_machine_instance.this.image_id
}

output "machine_type_id" {
  description = "Machine type ID of instance"
  value       = data.mgc_virtual_machine_instance.this.machine_type_id
}