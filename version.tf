terraform {
  required_providers {
    mgc = {
      source  = "MagaluCloud/mgc"
      version = "~> 0.44.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.11.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
  required_version = ">= 1.11.1"
}