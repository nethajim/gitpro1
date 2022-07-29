#creation of elastic IP address
resource "aws_eip" "my-1st-eip-vpc-dev" {
  instance = aws_instance.my-instance-1.id
  vpc      = true
  #meta argument
  depends_on = [
    aws_internet_gateway.vpc-dev-internetgateway
  ]

}
