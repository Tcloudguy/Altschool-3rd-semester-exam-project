terraform {
  backend "s3" {
    bucket = "jenkins-server-bkt"
    region = "eu-west-3"
    key = "eks/terraform.tfstate"
  }
}