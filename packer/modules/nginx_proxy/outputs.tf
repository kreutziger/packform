data "external" "nginx_sh" {
	program = ["bash", "echo.sh"]
	query = {
		file = "output/nginx_install.sh"
		content = "${data.template_file.nginx_install.rendered}"
	}
}

data "external" "nginx_service" {
	program = ["bash", "echo.sh"]
	query = {
		file = "output/nginx.service"
		content = "${data.template_file.nginx_service.rendered}"
	}
}

data "external" "nginx_config" {
	program = ["bash", "echo.sh"]
	query = {
		file = "output/nginx_config.sh"
		content = "${data.template_file.nginx_config.rendered}"
	}
}

output "provisioner" {
	value = "${data.template_file.nginx_provisioner.rendered}"
}
