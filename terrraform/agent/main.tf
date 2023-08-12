provider "aws" {
  region = "us-west-2"
}

module "ec2_instance" {
  source = "../modules/ec2"

  instance_name  = "jenkins-agent"
  ami_id         = "ami-08d0c4cc894f0f81a"
  instance_type  = "t2.small"
  key_name       = "rishav-jenkinsHA"
  subnet_ids     = ["subnet-078a44bff5704143a", "subnet-0bc6b0c2116447646", "subnet-080225c9d0cd6498d"]
  instance_count = 1
}
