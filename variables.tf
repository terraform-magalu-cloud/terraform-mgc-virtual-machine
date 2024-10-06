variable "create" {
  description = "Defines whether the virtual machine was created or not"
  default     = true
  type        = bool
}

variable "name" {
  description = "Defines the name of the virtual machine and must be unique"
  default     = ""
  type        = string
}

variable "name_is_prefix" {
  description = "Use name prefix"
  type        = bool
  default     = false

}

variable "ssh_key_create" {
  description = "Create ssh key with instance"
  type        = bool
  default     = false

}

variable "ssh_key_name" {
  description = "Name of the registered public key"
  type        = string
  default     = ""
}

variable "image_name" {
  description = "Name of the image to use to create the virtual machine"
  default     = "cloud-ubuntu-22.04 LTS"
  type        = string
}


variable "machine_type_name" {
  description = "Name of the type to use to create the virtual machine, same that instance type aws"
  default     = "cloud-bs1.small"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC where the virtual machine will run"
  default     = "vpc_default"
  type        = string
}

variable "delete_public_ip_on_destroy" {
  description = "Defines whether the created public ip should be deleted when the virtual machine is deleted"
  default     = true
  type        = bool
}

variable "associate_public_ip" {
  description = "Defines whether the public IP should be created and attached to the virtual machine"
  default     = true
  type        = bool
}

variable "additional_disk" {
  description = "Disks that will be additionally attached to the virtual machine, the structure is a map of maps"
  default     = {}
  type        = any
}