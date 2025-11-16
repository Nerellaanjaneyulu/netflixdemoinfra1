provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-03c870feb7c37e4ff"
  instance_type          = "t3.micro"
  key_name               = "ansible"
  vpc_security_group_ids = ["sg-0da49c9bc1e940771"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["ansible", "dev-1", "test-1"]
}
