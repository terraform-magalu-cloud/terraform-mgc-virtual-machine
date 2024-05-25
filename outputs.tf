output "created_at" {
  description = "Timestamp of when the virtual machine was created"
  value       = resource.mgc_virtual-machine_instances.this[0].created_at
}

output "instance_id" {
  description = "ID of the created virtual machine"
  value       = resource.mgc_virtual-machine_instances.this[0].id
}

output "status" {
  description = "Status of the virtual machine created, running, stopped, etc."
  value       = resource.mgc_virtual-machine_instances.this[0].status
}

output "current_ssh_key_name" {
  description = "Name of the ssh key used"
  value       = resource.mgc_virtual-machine_instances.this[0].current_ssh_key_name
}

output "updated_at" {
  description = "Timestamp of last modified virtual machine"
  value       = resource.mgc_virtual-machine_instances.this[0].updated_at
}

output "current_machine_type_id" {
  description = "Instance type ID used"
  value       = resource.mgc_virtual-machine_instances.this[0].current_machine_type.id
}


output "current_machine_type_name" {
  description = "Name of the instance type used"
  value       = resource.mgc_virtual-machine_instances.this[0].current_machine_type.name
}

output "current_name" {
  description = "Virtual machine name"
  value       = resource.mgc_virtual-machine_instances.this[0].current_name
}

output "current_image_id" {
  description = "ID of the image used in the virtual machine"
  value       = resource.mgc_virtual-machine_instances.this[0].current_image.id
}

output "associate_public_ip" {
  description = "Boolean value, whether there is a public IP or not: true or false"
  value       = resource.mgc_virtual-machine_instances.this[0].network.associate_public_ip
}

output "vpc" {
  description = "VPC being used by the virtual machine"
  value       = resource.mgc_virtual-machine_instances.this[0].network.vpc
}