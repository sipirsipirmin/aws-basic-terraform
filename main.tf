terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_spot_instance_request" "master_nodes" {
  ami                    = var.image_id
  spot_price             = "0.018"
  instance_type          = "t2.medium"
  spot_type              = "one-time"
  wait_for_fulfillment   = "true"
  
}