output "builder" {
	value = "${data.template_file.aws_builder.rendered}"
}

output "variables" {
	value = "${data.template_file.aws_variables.rendered}"
}
