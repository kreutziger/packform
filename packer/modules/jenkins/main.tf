data "template_file" "jenkins_install" {
	template = "${file("${path.module}/files/jenkins_install.sh.tpl")}"
	vars {
		version = "${var.version}"
	}
}

data "template_file" "jenkins_provisioner" {
	template = "${file("${path.module}/files/provisioner.tpl")}"
	vars {
		module_name = "${var.module_name}"
	}
}
