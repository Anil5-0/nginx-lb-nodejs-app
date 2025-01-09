variable "aws_region" {
    description = "AWS region"
}

variable "availability_zone_1" {
    description = "name of the Availability Zone 1"
}

variable "vpc_cidr_block" {
    description = "value of the VPC CIDR block"
}

variable "subnet_cidr_block_1" {
    description = "value of the Subnet CIDR block 1"
}

variable "keypair_name" {
    description = "name of the key pair"
}

variable "ami" {
    description = "AMI ID"
}

variable "instance_type" {
    description = "EC2 instance type"
}

variable "public_key_path" {
    description = "path to the public key file"
}