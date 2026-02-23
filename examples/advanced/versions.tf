terraform {
  required_providers {
    mgc = {
      source  = "MagaluCloud/mgc"
      version = "~> 0.44.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
  required_version = ">= 1.11.1"
}