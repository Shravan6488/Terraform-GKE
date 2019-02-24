#prerequsites

Git
Google Cloud SDK - https://cloud.google.com/sdk/
Terraform - https://www.terraform.io/downloads.html
Kubectl - https://kubernetes.io/docs/tasks/tools/install-kubectl/



#### execute below commands before terraform actions.Below variables initialize some variables that the GCP provider requires

export TF_VAR_project="$(gcloud config list \
  --format 'value(core.project)'
)"
export TF_VAR_region="us-east1"

#### #we’ll need to specify the administrative account and a random password for the cluster
export TF_VAR_user="admin"
export TF_VAR_password=" "   ( password must be atleast 16 characters long else it will through error)


#### perform terraform actions

terraform init
terraform plan
terraform apply

- After some time (10 to 20 minutes) we can test out our application

