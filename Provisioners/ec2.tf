resource "aws_instance" "first_terra" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"                               #loop will run for 3 times by getting variable names from variable.tf
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = {
    Name = "terraform"
    Environment = "dev"

  }
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip} > inventory"
    on_failure = continue
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
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

