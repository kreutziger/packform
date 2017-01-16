variable "aws_access_var" {
	description = "AWS access key in variables"
	default = "{{env `AWS_ACCESS_KEY_ID`}}"
}

variable "aws_access_bld" {
	description = "AWS access key in builder"
	default = "{{user `access_key`}}"
}

variable "aws_secret_var" {
	description = "AWS secret key in variables"
	default = "{{env `AWS_SECRET_ACCESS_KEY`}}"
}

variable "aws_secret_bld" {
	description = "AWS secret key in builder"
	default = "{{user `secret_key`}}"
}

variable "aws_region" {
	description = "AWS region"
}

variable "common_ami" {
	description = "Base AMI"
}

variable "instance_type" {
	default = "t2.small"
	description = "Instance type to create AMI with"
}

variable "ssh_user" {
	default = "centos"
	description = "User to ssh with"
}

variable "name" {
	description = "AMI image name"
}

variable "vpc_id" {
	description = "VPC to create AMI in"
}

variable "subnet_id" {
	description = "Subnet to create AMI in"
}
