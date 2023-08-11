provider "aws" {
  region = "us-west-2"
}

module "efs_module" {
  source     = "../modules/efs"
  vpc_id     = "vpc-05068a279490bee7a"
  subnet_ids = ["subnet-078a44bff5704143a", "subnet-0bc6b0c2116447646", "subnet-080225c9d0cd6498d"]
}
