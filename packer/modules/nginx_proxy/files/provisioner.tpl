    {
        "type": "file",
        "destination": "/tmp/nginx.service",
        "source": "nginx.service"
    },
    {
        "type": "file",
        "destination": "/tmp/nginx_config.sh",
        "source": "nginx_config.sh"
    },
    {
        "type": "shell",
        "execute_command" : "sudo sh '{{ .Path }}'",
        "script": "nginx_install.sh"
    }
