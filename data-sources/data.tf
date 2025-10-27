data "aws_ami" "joindevops" {
    owners           = ["973714476881"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}


data "aws_instance" "mongodb" {
    instance_id = "i-01a329f2b9461f3d8"
}

output "mongodb_info" {
    value = data.aws_instance.mongodb.private_ip
}