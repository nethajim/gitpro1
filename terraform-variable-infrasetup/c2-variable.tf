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