module "skeleton" {
	source = "../packer/modules/skeleton"
	builders = "${module.aws_builder.builder}"
	provisioners = "${join(",", list(
		"${module.java.provisioner}", 
		"${module.reverse_proxy.provisioner}",
		"${module.jenkins.provisioner}"
	))}"
	variables = "${module.aws_builder.variables}"
}

module "jenkins" {
	source = "../packer/modules/jenkins"
	version = "${var.jenkins_version}"
}

module "aws_builder" {
	source = "../packer/modules/aws_builder"
	aws_region = "${var.aws_region}"
	common_ami = "${var.base_ami}"
	name = "${var.ami_name}"
	subnet_id = "${var.subnet_id}"
	vpc_id = "${var.vpc_id}"
}

module "reverse_proxy" {
	source = "../packer/modules/nginx_proxy"
	port = "${module.jenkins.port}"
	version = "${var.nginx_version}"
}

module "java" {
	major_version = "${element(split(".", var.java_version), 0)}"
	minor_version = "${element(split(".", var.java_version), 1)}"
	build_number = "${element(split(".", var.java_version), 2)}"
  source = "../packer/modules/java"	
}
