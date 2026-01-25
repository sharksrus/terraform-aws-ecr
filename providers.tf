terraform {
  required_version = ">= 1.14"
  required_providers {
    aws = {
      version = ">= 6.0.0"
      source  = "hashicorp/aws"
    }
  }
}
