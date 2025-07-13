provider "aws" {
   region = "ap-south-1"
}

data "terraform_remote_state" "db" {
  backend = "local"
  config = {
    path = "../terraform-db/terraform.tfstate"
  }
}