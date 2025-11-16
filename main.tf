provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-03f04a34a6d2050e1"
  instance_type          = "t3.micro"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-002dba717d31408b7"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["ansible", "dev-1", "test-1"]
}
