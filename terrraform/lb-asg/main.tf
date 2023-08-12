provider "aws" {
  region = "us-west-2"
}

module "lb-asg" {
  source        = "../modules/lb-asg"
  subnets       = ["subnet-078a44bff5704143a", "subnet-0bc6b0c2116447646", "subnet-080225c9d0cd6498d"]
  ami_id        = "ami-038b497b7b8d3d7e3" #controller ID
  instance_type = "t2.small"
  key_name      = "rishav-jenkinsHA"
  environment   = "dev"
  vpc_id        = "vpc-05068a279490bee7a"
}
