# AMI ID variable
variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

# Instance type variable
variable "instance_type" {
  type    = string
  default = "t3.micro"
}

# Tags variable
variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "Terraform-demo"
    Environment = "Dev"
    Terraform   = "true"
  }
}

# Security group name variable
variable "sg_name" {
  type        = string
  default     = "allow-alll"
  description = "Security Group attached to EC2 instance"
}

# CIDR block variable
variable "cidr_eng" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

# Port variables
variable "from_port" {
  type    = number
  default = 0
}

variable "to_port" {
  type    = number
  default = 0
}

variable "protocol_to_allow" {
  type    = string
  default = "-1"
}
