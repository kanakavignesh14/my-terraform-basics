locals{
    instance_type = "t3.micro"
    common_name = "${var.Project}-${var.environment}"  # here common_name = roboshop-dev   herer we are setting this much but we need to set resousre name as well like useer or catalogue
}