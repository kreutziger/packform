data "external" "jenkins_sh" {
	program = ["bash", "echo.sh"]
	query = {
		file = "output/${var.module_name}_install.sh"
		content = "${data.template_file.jenkins_install.rendered}"
	}
}

output "provisioner" {
	value = "${data.template_file.jenkins_provisioner.rendered}"
}

output "port" {
	value = "8080"
}
