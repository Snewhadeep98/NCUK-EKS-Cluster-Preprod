terraform {
  backend "s3" {
    bucket = "ncukpreprod-eks"
    region = "eu-west-3"
    key = "eks/terraform.tfstate"
  }
}

