# Nginx-Powered Load Balancing with Terraform, Ansible and Docker 

A comprehensive project demonstrating infrastructure automation using Terraform on AWS, configuration management using Ansible, containerization using Docker, and load balancing using Nginx.

## Project Overview

This project implements a fully automated infrastructure setup and deployment pipeline for running multiple Node.js applications behind an Nginx load balancer with SSL termination.

This project demonstrates the use of Nginx as a load balancer. The goal is to learn and understand how Nginx helps in load balancing and securing communication with SSL certificates.

## Architecture

- **Infrastructure**: Terraform on AWS (VPC, Security Groups, EC2 etc.)
- **Configuration Management**: Ansible
- **Containerization**: Docker & Docker Compose
- **Load Balancing**: Nginx
- **Security**: SSL/TLS with HTTPS redirection
- **Application**: Node.js with EJS templating


## Application

The project includes a sample Node.js application that renders an index.ejs template with the name of the app. The application is containerized using Docker and run as three separate apps with names app1, app2, and app3 using Docker Compose.

## Load Balancing and SSL

Nginx is used as a reverse proxy to load balance traffic across the three apps. Self-signed SSL certificates are generated and used to secure communication between the client and server. The Nginx configuration is updated to redirect HTTP traffic to HTTPS.

## Features

- Automated AWS infrastructure provisioning using Terraform
- Three containerized Node.js applications running simultaneously
- Nginx reverse proxy with round-robin load balancing
- SSL/TLS encryption with HTTPS redirection
- Automated deployment using Ansible
- Infrastructure as Code (IaC) principles

## Technical Components

### Infrastructure (Terraform)
- VPC with Internet Gateway
- Public Subnet
- Security Groups
- Route Tables
- EC2 Instance
- Key Pair Management

### Application
- Node.js application with EJS templating
- Dockerized applications running on ports 3001, 3002, and 3003
- Base application server on port 3000

### Configuration Management (Ansible)
- System package updates
- Docker, Docker compose and Nginx installation
- SSL certificate management
- Nginx configuration management
- Node.js app deployment using compose

### Load Balancing
- Round-robin algorithm
- SSL termination
- HTTP to HTTPS redirection
- Reverse proxy configuration

### Security
- Self-signed SSL certificates
- HTTPS enforcement
- Secure infrastructure configuration
- Docker container isolation

## Prerequisites
- AWS Account
- Terraform installed
- Ansible installed
- Basic understanding of Node.js

## Getting Started
1. Clone the repository
2. Configure AWS credentials
3. Run Terraform init and apply
4. The public IP will be automatically shown after deployment

   ![](/docs/images/tf_output.PNG)
5. Hit the public Ip through browser. Go to Advanced option & proceed to view app ( as it's self signed )

   ![](/docs/images/web1.PNG)
   ![](/docs/images/web2.PNG)
   ![](/docs/images/web3.PNG)

6. Upon checking the compose logs, we can see the requests are distributed in round robin fashion across 3 node-js apps

   ![](/docs/images/compose_logs.PNG)
