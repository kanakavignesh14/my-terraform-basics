resource "aws_instance" "first_terra" {
  count = 3
  ami           = "ami-09c813fb71547fc4f"
  instance_type = var.instances_type[count.index]                                #loop will run for 3 times by getting variable names from variable.tf
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = {
    Name = var.instances_name[count.index]
    Environment = "dev"

  }
}
resource "aws_security_group" "allow-all" {
  name   = "allow-multi"
  
  egress {
    from_port       = 0 # from port 0 to port 0 means to all ports
    to_port         = 0
    protocol        = "-1"  # all protocol
    cidr_blocks     = ["0.0.0.0/0"]
  }  
  
  ingress {
    from_port       = 0 # from port 0 to all ports
    to_port         = 0
    protocol        = "-1"  # all protocol
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg-multi"
  }
}

