data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      website = var.domain_name
      prefix  = var.prefix
    }
  }
}
