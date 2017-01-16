provider "aws" {
	region = "${var.aws_region}"
}

variable "aws_region" {
	default = "eu-central-1"
	description = "AWS Region"
}

variable "ami_name" {
	default = "jenkins"
	description = "Name of the resulting AMI"
}

variable "java_version" {
	description = "Java version in format <major>.<minor>.<build>"
}

variable "nginx_version" {
	description = "Nginx version to install"
}

variable "jenkins_version" {
	description = "Jenkins version to install"
}

variable "base_ami" {
	description = "AMI to use for the image"
}

variable "subnet_id" {
	description = "AWS subnet id for packer to use"
}

variable "vpc_id" {
	description = "AWS VPC id for packer to use"
}
