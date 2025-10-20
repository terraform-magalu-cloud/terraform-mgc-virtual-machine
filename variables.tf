variable "additional_disk" {
  description = "Disks that will be additionally attached to the virtual machine, the structure is a map of maps"
  default     = {}
  type        = any
}

variable "attach_public_ip" {
  description = "Attach public ip"
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "Zone where instance will be provisoned"
  type        = string
  default     = ""
}

variable "backup_enabled" {
  description = "Enable backup"
  type        = bool
  default     = true
}

variable "backup_retention_days" {
  description = "Retention backup for days"
  type        = number
  default     = 7
}

variable "backup_schedule" {
  description = "Schedule time backup"
  type        = string
  default     = "03:00:00"
}

variable "create" {
  description = "Defines whether the virtual machine was created or not"
  default     = true
  type        = bool
}

variable "disk_type" {
  description = "Set type disk"
  default     = "cloud_nvme1k"
  type        = string
}

variable "image_name" {
  description = "Name of the image to use to create the virtual machine"
  default     = "cloud-ubuntu-24.04 LTS"
  type        = string
}

variable "machine_type_name" {
  description = "Name of the type to use to create the virtual machine, same that instance type aws"
  default     = "BV1-1-10"
  type        = string
}

variable "name" {
  description = "Defines the name of the virtual machine and must be unique"
  default     = ""
  type        = string
}

variable "security_group_names" {
  description = "Defines rules of security group: map of map"
  type        = list(string)
  default     = []
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

variable "user_data" {
  description = "Setup virtual machine with user data"
  default     = ""
  type        = string
}

variable "vpc_name" {
  description = "Set name vpc will use"
  default     = "vpc_default"
  type        = string

}