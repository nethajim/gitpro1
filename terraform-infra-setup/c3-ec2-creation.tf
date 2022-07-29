#creation of ec2
resource "aws_instance" "my-instance-1" {
  ami                    = "ami-0cff7528ff583bf9a"
  instance_type          = "t2.micro"
  key_name               = "newkey"
  subnet_id              = aws_subnet.vpc-dev-subnet1.id
  vpc_security_group_ids = [aws_security_group.vpc-dev-sg.id]
  user_data              = file("apache-install.sh")

}


