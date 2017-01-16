data "external" "packer_manifest" {
	program = ["bash", "echo.sh"]
	query = {
		file = "output/${var.module_name}.json"
		content = "${data.template_file.packer_manifest.rendered}"
	}
}
