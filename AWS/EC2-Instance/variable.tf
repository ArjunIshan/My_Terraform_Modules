variable "instance_type" {
    default = ""
  
}

variable "aws_region" {
    default = "us-east-1"
  
}
variable "number_of_instance" {
    default = 1
  
}

variable "ami_name" {
    default = ""
  
}


variable "autoconfig_script_version" {
    default = "v1.5.4" 
}

variable "iam_instance_profile" {
    default = "myautoconfig-role"
  
}

variable "startup_script" {
    default = "startup.ps1"
    description = "The name of the script in Github StartupScriptRepo to put into user data"
  
}


variable "tags" {
    default = ""
  
}

variable "root_volume_type" {
    default = "gp3"
  
}


variable "root_volume_size" {
    default = "30"
  
}


variable "my_roles" {
    default = ""
  
}