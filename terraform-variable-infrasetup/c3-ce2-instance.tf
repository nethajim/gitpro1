resource "aws_instance" "my-web-instance" {
  ami           = var.ec2_ami_id
  instance_type = "t2.micro"
  #availability_zone      = us-east-1a
  key_name               = "newkey"
  count                  = var.ec2_count
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
  vpc_security_group_ids = [aws_security_group.sg-ssh.id, aws_security_group.sg-gourpweb.id]
  tags = {
    Name = "myweb-apache"
  }

}