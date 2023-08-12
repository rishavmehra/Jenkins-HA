provider "aws" {
  region = "us-west-2"
}

variable "instance_name" {
  type    = string
  default = "jenkins-agent"
}

variable "ami_id" {
  type    = string
  default = "ami-08d0c4cc894f0f81a"
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}

variable "key_name" {
  type    = string
  default = "rishav-jenkinsHA"
}

variable "security_group_ids" {
  type    = list(string)
  default = ["sg-01ce819e8d65269f0"]
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-078a44bff5704143a", "subnet-0bc6b0c2116447646", "subnet-080225c9d0cd6498d"]
}
