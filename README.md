# Define "element" and "count" in Terraform


1. Lets first defirne what is "element" functionality?

"element" is one of the Terraform Functions, that retrieves a single element from a list. The list is define by [].

"element"
- (list, index)

- The index is zero-based. This function produces an error if used with an empty list. The index must be a non-negative integer.
~~~
Examples:
> element(["a", "b", "c"], 0)
a

> element(["a", "b", "c"], 1)
b

> element(["a", "b", "c"], 2)
c
~~~

2. What is Count Index?

In blocks where count is set, an additional count object is available in expressions, so you can modify the configuration of each instance. This object has one attribute:

"count.index" 
- The distinct index number (starting with 0) corresponding to this instance.

~~~
resource "aws_security_group" "web" {
  name        = "web"
  count = 3
  vpc_id      = var.vpc_id   
}
~~~
# How to use Element and Count Index together?
Scenario:

Create a security group named web with 3 ports are open

Ports: "22" "23" "24"
~~~
provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web" {
  name        = "test"
  vpc_id      = var.vpc_id   
}

# ingress rule tcp 
resource "aws_security_group_rule" "ingress_tcp" {
  count       = 3
  type        = "ingress"
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = element(var.tcp_ports, count.index)
  to_port     = element(var.tcp_ports, count.index)
  security_group_id = aws_security_group.web.id
}

# egress rule allow-all
resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}
~~~
