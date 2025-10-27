resource "aws_instance" "first_terra" {
  count = 3
  ami           = var.ami_id
  instance_type = local.instance_type    # refering locals.tf    #loop will run for 3 times by getting variable names from variable.tf
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = merge (
    var.common-tags-ec2,
    {
      Name = "${local.common_name}-local-demo"            # used locals here from locals.tf
    }

  )
  
}
resource "aws_security_group" "allow-all" {
  name   = "${local.common_name}-allow-multi"
  
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
  tags = merge (
    var.common-tags-ec2,
    {
      Name = "${local.common_name}-allow-multi"
    }

  )
}

