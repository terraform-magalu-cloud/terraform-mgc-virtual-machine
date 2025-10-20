variable "name" {
  description = "name this machine"
  default     = "example-advanced"
  type        = string
}


variable "api_key" {
  type        = string
  sensitive   = true
  description = "The Magalu Cloud API Key"
}

variable "region" {
  description = "Region to deploy machine"
  default     = "br-ne1"
  type        = string
}