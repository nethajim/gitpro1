resource "aws_security_group" "sg-ssh" {
  name        = "allow ports"
  description = "this is to allow ec2-instance to outside world"
  #allow port 22
  ingress {
    description = "Allow 22 port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    description = "Allow all IP and All  ports"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }
}

resource "aws_security_group" "sg-gourpweb" {
  name        = "allow this all ports"
  description = "this is to allow ec2-instance to outside world"
  ingress {
    description = "Allow 80 port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    description = "Allow all IP and All  ports"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }
}


