variable "instances" {
    #default = ["mongodb"."redis","rabbitmq"]       # creating line of instances with respective names
     default = {
        mongodb = "t3.micro"
        redis = "t3.micro"
        mysql = "t3.micro"
     }
}
variable "zone_id" {
    default = "Z04092822ZCUHU7SWZ18H"
}
variable "domain_name" {
    default = "vigi-devops.fun"
}