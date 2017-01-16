data "external" "java_install" {
	program = ["bash", "echo.sh"]
	query = {
		file = "output/${var.module_name}_install.sh"
		content = "${data.template_file.java_install.rendered}"
	}
}

output "provisioner" {
	value = "${data.template_file.java_provisioner.rendered}"
}
