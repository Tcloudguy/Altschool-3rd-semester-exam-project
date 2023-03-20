terraform {
  backend "s3" {
    bucket = "adewale-server-bkt"
    region = "eu-west-3"
    key = "eks/terraform.tfstate"
  }
}
