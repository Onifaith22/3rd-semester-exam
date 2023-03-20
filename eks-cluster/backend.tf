terraform {
  backend "s3" {
    bucket = "main-server-bkt"
    region = "us-east-2"
    key = "eks/terraform.tfstate"
  }
}
