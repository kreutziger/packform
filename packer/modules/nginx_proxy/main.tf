data "template_file" "nginx_install" {
	template = "${file("${path.module}/files/nginx_install.sh.tpl")}"
	vars {
		nginx_version = "${var.version}"
	}
}

data "template_file" "nginx_service" {
	template = "${file("${path.module}/files/nginx.service.tpl")}"
}

data "template_file" "nginx_config" {
	template = "${file("${path.module}/files/nginx_config.sh.tpl")}"
	vars {
		port = "${var.port}"
	}
}

data "template_file" "nginx_provisioner" {
	template = "${file("${path.module}/files/provisioner.tpl")}"
}
