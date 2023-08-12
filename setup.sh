# iam
cd terraform/iam
terraform init
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve


#efs
cd terraform/efs
terraform init
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve

#Build Jenkins Controller AMI
packer build -var "efs_mount_point=fs-00332c903da38a1d4.efs.us-west-2.amazonaws.com" jenkins-controller.pkr.hcl
#Build Jenkins Agent AMI
packer build -var "public_key_path=/jenkins-ha/jenkins/id_rsa.pub" jenkins-agent.pkr.hcl

# Deploy Jenkins Controller Autoscaling Group with Load Balancer
terraform init
terraform plan 
terraform apply --auto-approve
aws ec2 describe-instances --filter "Name=tag:Name,Values=jenkins-controller" --query 'Reservations[].Instances[?State.Name==`running`].PublicIpAddress' --output text
sudo cat /data/jenkins/secrets/initialAdminPassword

# Deploy Jenkins Agent 
cd terraform/agent
terraform init
terraform plan 
terraform apply --auto-approve

#Configure Agent Node With Controller




# 
terraform init
terraform plan 
terraform apply --auto-approve
