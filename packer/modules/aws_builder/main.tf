data "template_file" "aws_builder" {
	template = "${file("${path.module}/files/builder.tpl")}"

	vars {
		aws_access = "${var.aws_access_bld}"
		aws_secret = "${var.aws_secret_bld}"
		aws_region = "${var.aws_region}"
		common_ami = "${var.common_ami}"
		instance_type = "${var.instance_type}"
		ssh_user = "${var.ssh_user}"
		name = "${var.name}"
		vpc_id = "${var.vpc_id}"
		subnet_id = "${var.subnet_id}"
	}
}

data "template_file" "aws_variables" {
	template = "${file("${path.module}/files/variables.tpl")}"

	vars {
		aws_access = "${var.aws_access_var}"
		aws_secret = "${var.aws_secret_var}"
	}
}
