    {
        "type": "amazon-ebs",
        "access_key": "${aws_access}",
        "secret_key": "${aws_secret}",
        "region": "${aws_region}",
        "source_ami": "${common_ami}",
        "instance_type": "${instance_type}",
        "ssh_username": "${ssh_user}",
        "ssh_pty" : "true",
        "ami_name": "${name}",
        "vpc_id" : "${vpc_id}",
        "subnet_id" : "${subnet_id}"
    }
