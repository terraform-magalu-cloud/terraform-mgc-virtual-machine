
variable "user_data" {
  description = "value"
  default     = ""
  type        = string
}

variable "create" {
  description = "value"
  default     = true
  type        = bool
}

variable "name" {
  description = "value"
  default     = ""
  type        = string
}

variable "ssh_key_name" {
  description = "value"
  type        = string
}

variable "image_name" {
  description = "value"
  default     = "cloud-debian-12 LTS"
  type        = string
}


variable "machine_type_name" {
  description = "value"
  default     = "cloud-bs1.small"
  type        = string
}

variable "network_name" {
  description = "value"
  default     = "vpc_default"
  type        = string
}

variable "delete_public_ip_on_destroy" {
  description = "value"
  default     = true
  type        = bool
}

variable "associate_public_ip" {
  description = "value"
  default     = true
  type        = bool
}

variable "additional_disk" {
  description = "value"
  default     = []
  type        = list(any)
}