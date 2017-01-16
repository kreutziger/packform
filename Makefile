TARGET_FOLDER := target
OPERATION := $(word 1,$(subst _, ,$(MAKECMDGOALS)))
IMAGE := $(word 2,$(subst _, ,$(MAKECMDGOALS)))

TERRAFORM_APPLY := @cd $(TARGET_FOLDER) ; terraform apply
TERRAFORM_GET_MODULES := @cd $(TARGET_FOLDER) ; terraform get .
PACKER_VALIDATE := @cd $(TARGET_FOLDER)/output ; packer validate manifest.json
PACKER_BUILD := @cd $(TARGET_FOLDER)/output ; packer build manifest.json

$(info OPERATION : $(OPERATION))
$(info IMAGE : $(IMAGE))

.PHONY: validate clean

validate:
	@terraform -v >/dev/null 2>&1 || { echo "Terraform is not installed! Aborting." >&2; exit 100; }
	@aws --version >/dev/null 2>&1 || { echo "AWS cli is not installed! Aborting." >&2; exit 100; }
	@packer version >/dev/null 2>&1 || { echo "Packer is not installed! Aborting." >&2; exit 100; }

clean:
	@rm -fr $(TARGET_FOLDER)

init: validate clean
	@mkdir $(TARGET_FOLDER)

prepare_packer: init
	@mkdir -p $(TARGET_FOLDER)/output
	@cp packer/manifests/$(IMAGE)/* $(TARGET_FOLDER)
	@cp packer/tools/echo.sh $(TARGET_FOLDER)
	@$(TERRAFORM_GET_MODULES)
	@$(TERRAFORM_APPLY) -var-file=vars.tfvars

validate_$(IMAGE): prepare_packer
	@$(PACKER_VALIDATE)

build_$(IMAGE): prepare_packer
	@$(PACKER_BUILD)

destroy_$(IMAGE): init
	@aws ec2 describe-images --filters "Name=name,Values=$(IMAGE)" | grep ImageId | cut -d'"' -f 4 >$(TARGET_FOLDER)/$(IMAGE).imagesid
	@aws ec2 describe-images --filters "Name=name,Values=$(IMAGE)" | grep SnapshotId | cut -d'"' -f 4 >$(TARGET_FOLDER)/$(IMAGE).snapshotid
	@cat $(TARGET_FOLDER)/$(IMAGE).imagesid | xargs -L 1 aws ec2 deregister-image --image-id
	@cat $(TARGET_FOLDER)/$(IMAGE).snapshotid | xargs -L 1 aws ec2 delete-snapshot --snapshot-id
