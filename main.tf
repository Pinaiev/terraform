provider "aws" {
  region     = "eu-central-1"
}
#VPC
# resource "aws_vpc" "actpro-vpc" {
#      cidr_block = "10.0.0.0/16"
#       tags = {
#         Name = "ActPRO-NET"
#   }
# }
#Subnet
# resource "aws_subnet" "front-end-net" {
#   vpc_id     = aws_vpc.actpro-vpc.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "Public-net"
#   }
# }
#backend
# resource "aws_subnet" "back-end-net" {
#   vpc_id     = aws_vpc.actpro-vpc.id
#   cidr_block = "10.0.2.0/24"

#   tags = {
#     Name = "Private-net"
#   }
# }
#123
# resource "aws_internet_gateway" "Actpro-GW" {
#   vpc_id = aws_vpc.actpro-vpc.id
#   tags = {
#     Name = "Actpro-GW"
#   }
# }

# resource "aws_route_table" "Actpro-RT" {
#   vpc_id = aws_vpc.actpro-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.Actpro-GW.id
#   } 

#   tags = {
#     Name = "Actpro-RT-Front"
#   }
# }

# resource "aws_route_table_association" "a-front-net" {
#   subnet_id      = aws_subnet.front-end-net.id
#   route_table_id = aws_route_table.Actpro-RT.id
# }

# resource "aws_security_group" "actpro-sg" {
#   name        = "ssh-web"
#   description = "Allow 22 and 80 ports traffic"
#   vpc_id      = aws_vpc.actpro-vpc.id

#   ingress {
#     description      = "SSH from VPC"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   ingress {
#     description      = "WEB from VPC"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "ssh-web-sg"
#   }
# }


# resource "aws_instance" "web" {
#   ami           = "ami-026c3177c9bd54288"
#   instance_type = "t2.micro"
#   count = 1
#   key_name = "aws"
#   vpc_security_group_ids = [aws_security_group.actpro-sg.id]
#   subnet_id = aws_subnet.front-end-net.id
#   associate_public_ip_address = true
#   user_data = <<EOF
# #!/bin/bash
# apt update -y
# apt install nginx -y
# EOF

#   tags = {
#     Name = "Web-Server"
#   }
# }
