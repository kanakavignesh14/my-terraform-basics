resource "aws_instance" "first_terra" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.large"
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = {
    Name = "terraform"

  }
}
resource "aws_security_group" "allow-all" {
  name   = "allow-terra" # it is actual security gropu name right?
  
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
    Name = "terra_sg" # it will appear in console 
  }
}

