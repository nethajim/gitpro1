#terraform settings block 
terraform {
  required_version = "~> 0.14.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}



/*terraform {
  required_version = "~> 0.14.6" # which means >= 0.14.6 and < 0.15
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}*/



provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


