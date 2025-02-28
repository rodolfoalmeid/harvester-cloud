# How to create resources

- Copy `./terraform.tfvars.exmaple` to `./terraform.tfvars`
- Edit `./terraform.tfvars`
  - Update the required variables:
    - `harvester_url` to specify the URL of the Harvester cluster API
    - `kubeconfig_file_path` to specify the full path to the Kubeconfig file, which is required to authenticate with the Harvester cluster
    - `kubeconfig_file_name` to specify the name of the Kubeconfig file used to access the Harvester cluster

#### Terraform Apply

```bash
terraform init -upgrade && terraform apply -auto-approve
```

#### Terraform Destroy

```bash
terraform destroy -auto-approve
```

#### OpenTofu Apply

```bash
tofu init -upgrade && tofu apply -auto-approve
```

#### OpenTofu Destroy

```bash
tofu destroy -auto-approve
```

# DEMOSTRATION - Given a Harvester cluster, create an Ubuntu Image and a single Virtual Machine (using the default variables)

### Create the Ubuntu Image

```console
$ cd projects/harvester-ops/image-creation
```

#### Configure the terraform.tfvars file with the minimum necessary configurations

```console
$ cat terraform.tfvars
harvester_url             = "<HARVESTER_URL>"
kubeconfig_file_path      = "../../google-cloud/"
kubeconfig_file_name      = "<PREFIX>_kube_config.yml"
```

#### Demonstration of applying Terraform files

![](../../../images/HARV_OPS_PROJ_README_21.png)
![](../../../images/HARV_OPS_PROJ_README_22.png)

#### Harvester Cluster - UI | Image

![](../../../images/HARV_OPS_PROJ_README_23.png)

### Create the Virtual Machine

```console
$ cd ../vm-pool-creation
```

#### Configure the terraform.tfvars file with the minimum necessary configurations

```console
$ cat terraform.tfvars
harvester_url             = "<HARVESTER_URL>"
kubeconfig_file_path      = "../../google-cloud/"
kubeconfig_file_name      = "<PREFIX>_kube_config.yml"
```

#### Demonstration of applying Terraform files

![](../../../images/HARV_OPS_PROJ_README_24.png)
![](../../../images/HARV_OPS_PROJ_README_25.png)

#### Harvester Cluster - UI | Virtual Machines

![](../../../images/HARV_OPS_PROJ_README_26.png)

#### Test VM access

![](../../../images/HARV_OPS_PROJ_README_27.png)
