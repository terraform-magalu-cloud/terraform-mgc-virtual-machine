output "created_at" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "Timestamp of when the virtual machine was created"
  value       = try(resource.mgc_virtual-machine_instances.this[0].created_at, null)
}

output "instance_id" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "ID of the created virtual machine"
  value       = try(resource.mgc_virtual-machine_instances.this[0].id, null)
}

output "status" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "Status of the virtual machine created, running, stopped, etc."
  value       = try(resource.mgc_virtual-machine_instances.this[0].status, null)
}

output "current_ssh_key_name" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "Name of the ssh key used"
  value       = try(resource.mgc_virtual-machine_instances.this[0].current_ssh_key_name, null)
}

output "updated_at" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "Timestamp of last modified virtual machine"
  value       = try(resource.mgc_virtual-machine_instances.this[0].updated_at, null)
}

output "current_machine_type_id" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "Instance type ID used"
  value       = try(resource.mgc_virtual-machine_instances.this[0].current_machine_type.id, null)
}


output "current_machine_type_name" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "Name of the instance type used"
  value       = try(resource.mgc_virtual-machine_instances.this[0].current_machine_type.name, null)
}

output "current_name" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "Virtual machine name"
  value       = try(resource.mgc_virtual-machine_instances.this[0].current_name, null)
}

output "current_image_id" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "ID of the image used in the virtual machine"
  value       = try(resource.mgc_virtual-machine_instances.this[0].current_image.id, null)
}

output "associate_public_ip" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "Boolean value, whether there is a public IP or not: true or false"
  value       = try(resource.mgc_virtual-machine_instances.this[0].network.associate_public_ip, null)
}

output "vpc" {
  depends_on  = [mgc_virtual-machine_instances.this]
  description = "VPC being used by the virtual machine"
  value       = try(resource.mgc_virtual-machine_instances.this[0].network.vpc, null)
}