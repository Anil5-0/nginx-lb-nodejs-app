provider "aws" {
    region = var.aws_region
}

resource "aws_vpc" "nginx-vpc" {
    cidr_block = var.vpc_cidr_block
}

resource "aws_internet_gateway" "nginx-igw" {
    vpc_id = aws_vpc.nginx-vpc.id
}

resource "aws_subnet" "nginx-subnet-1" {
    vpc_id = aws_vpc.nginx-vpc.id
    availability_zone = var.availability_zone_1
    cidr_block = var.subnet_cidr_block_1
}

resource "aws_route_table" "nginx-rt" {
    vpc_id = aws_vpc.nginx-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.nginx-igw.id
    }
}

resource "aws_route_table_association" "nginx-rta" {
    subnet_id = aws_subnet.nginx-subnet-1.id
    route_table_id = aws_route_table.nginx-rt.id
}

resource "aws_security_group" "nginx-sg" {
    vpc_id = aws_vpc.nginx-vpc.id

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "nginx-keypair" {
    key_name = var.keypair_name
    public_key = file(var.public_key_path)
}

resource "aws_instance" "nginx-server" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.nginx-subnet-1.id
    vpc_security_group_ids = [aws_security_group.nginx-sg.id]
    key_name = aws_key_pair.nginx-keypair.key_name
    user_data = base64encode(file("${path.path.module}/userdata.sh)"))
}

