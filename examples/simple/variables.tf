variable "name" {
  description = "name this machine"
  default     = "example-simple"
  type        = string
}

variable "api_key" {
  type        = string
  sensitive   = true
  description = "The Magalu Cloud API Key"
}

variable "region" {
  type        = string
  description = "Regions Magalu Cloud"
  default     = "br-ne1"
}