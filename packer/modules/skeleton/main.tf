data "template_file" "packer_manifest" {
	template = "${file("${path.module}/files/skeleton.tpl")}"

	vars {
		builders = "${var.builders}"
		provisioners = "${var.provisioners}"
		variables = "${var.variables}"
	}
}
