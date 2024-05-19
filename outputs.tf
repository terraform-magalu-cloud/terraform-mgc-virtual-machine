output "created_at" {
  description = "value"
  value       = resource.mgc_virtual-machine_instances.this[0].created_at
}

output "instance_id" {
  description = "value"
  value       = resource.mgc_virtual-machine_instances.this[0].id
}

output "status" {
  description = "value"
  value       = resource.mgc_virtual-machine_instances.this[0].status
}

output "current_ssh_key_name" {
  description = "value"
  value       = resource.mgc_virtual-machine_instances.this[0].current_ssh_key_name
}

output "updated_at" {
  description = "value"
  value       = resource.mgc_virtual-machine_instances.this[0].updated_at
}

output "current_machine_type_id" {
  description = "value"
  value       = resource.mgc_virtual-machine_instances.this[0].current_machine_type.id
}


output "current_machine_type_name" {
  description = "value"
  value       = resource.mgc_virtual-machine_instances.this[0].current_machine_type.name
}

output "current_name" {
  description = "value"
  value       = resource.mgc_virtual-machine_instances.this[0].current_name
}

output "current_image_id" {
  description = "value"
  value       = resource.mgc_virtual-machine_instances.this[0].current_image.id
}