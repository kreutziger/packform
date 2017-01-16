data "template_file" "java_install" {
	template = "${file("${path.module}/files/java_install.sh.tpl")}"
	vars {
		major_version = "${var.major_version}"
		minor_version = "${var.minor_version}"
		build_number = "${var.build_number}"
	}
}

data "template_file" "java_provisioner" {
	template = "${file("${path.module}/files/provisioner.tpl")}"
	vars {
		module_name = "${var.module_name}"
	}
}
