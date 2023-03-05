variable "instance_type"{
    type = string
    description = " This is an intance type for EC2 Instance"
    default = "t2.micro"
}
variable "env"{
    type = string
    description = " This is an intance env for EC2 Instance"
    default = "dev"
}
variable "main_sg1"{
    type = string
    description = " This is a sg name"
    default = "security_group"
}

variable "ports"{
    type = list(string)
    description = " This is a list of ports"
    default = ["22", "80", "3306", "21", "20"]
}

#element (list, index)