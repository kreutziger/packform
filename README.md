# Overview
This concept allows you to create packer manifests for AWS with terraform as a templating engine. This is done via terraform modules, which take parameters, put them into templates and creates needed files. The outputs will then go into a manifest skeleton, which can be used by packer to create its images. Similar to different configuration manager you have modules, where you create terraform modules, which hold everything you need to create the packer manifest. After you have all the modules to describe your use case, you set up a manifest and combine all modules to create an image manifest, e. g. as in the example for jenkins.

Tested on Ubuntu 16.04., dependencies:
- terraform
- packer
- jq
