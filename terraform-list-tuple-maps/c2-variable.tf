#input variable
variable "aws_region" {
  description = "This is to tell variable way of doing"
  type        = string
  default     = "us-east-1"
}


variable "ec2_ami_id" {
  description = "AMI iD of ec2-vm"
  type        = string
  default     = "ami-0cff7528ff583bf9a"
}

variable "ec2_count" {
  description = "count of ec2-instance"
  type        = number
  default     = 1

}

variable "aws_profile" {
  type    = string
  default = "default"

}

/*variable "aws_instance_type" {
  description = "This is about type list"
  type        = list(string)
  default     = ["t2.micro", "t1.micro"]


} */

variable "aws_instance_type" {
  description = "This is about type map"
  type        = map(string)
  default = {
    "big"   = "t2.micro"
    "small" = "t1.micro"
  }

}