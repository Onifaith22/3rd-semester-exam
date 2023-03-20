terraform {
  backend "s3" {
    bucket = "micro-server-bkt"
    region = "us-east-2"
    key = "eks/terraform.tfstate"
  }
}
