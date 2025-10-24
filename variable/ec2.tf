resource "aws_instance" "first_terra" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = var.ec2_tags
}
resource "aws_security_group" "allow_all" {
  name   = var.sg_name
  
  egress {
    from_port       = var.from_port # from port 0 to port 0 means to all ports
    to_port         = var.to_port
    protocol        = "-1"  # all protocol
    cidr_blocks     = var.cidr_eng
  }  
  
  ingress {
    from_port       = var.from_port # from port 0 to all ports
    to_port         = var.to_port
    protocol        = var.protocol_to_allow  # all protocol
    cidr_blocks     = var.cidr_eng
  }
  tags = {
    Name = "tera_sg"
  }
}

