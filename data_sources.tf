data "aws_ami" "amazon_linux_2" {
  most_recent = true 
  owners = ["amazon"] 

#Filter - optionsl, we use filter to narrow the filter down
  
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*"] 
  }

filter {
    name   = "architecture"
    values = ["x86_64"] 
  }
}