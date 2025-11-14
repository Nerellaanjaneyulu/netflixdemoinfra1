provider "aws" {
  region = "us-south-1"
}

resource "aws_instance" "one" {
  count                  = 5
  ami                    = "ami-03c870feb7c37e4ff"
  instance_type          = "c7i-flex.large"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-0da49c9bc1e940771"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["ansible", "dev-1", "dev-2", "test-1", "test-2]
}
