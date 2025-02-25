## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.6.6 |
| <a name="requirement_ssh"></a> [ssh](#requirement\_ssh) | 2.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.detach_and_reboot_nodes](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.wait_harvester_services_startup](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_harvester_url"></a> [harvester\_url](#input\_harvester\_url) | Specifies the URL of the Harvester cluster API. | `string` | n/a | yes |
| <a name="input_kubeconfig_file_name"></a> [kubeconfig\_file\_name](#input\_kubeconfig\_file\_name) | Specifies the name of the Kubeconfig file used to access the Harvester cluster. | `string` | n/a | yes |
| <a name="input_kubeconfig_file_path"></a> [kubeconfig\_file\_path](#input\_kubeconfig\_file\_path) | Specifies the full path where the Kubeconfig file is located. | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Specifies the name of the Harvester VM network. Default is 'vlan2'. | `string` | `"vlan2"` | no |
| <a name="input_private_ssh_key_file_name"></a> [private\_ssh\_key\_file\_name](#input\_private\_ssh\_key\_file\_name) | Specifies the name of the private SSH key file used for authentication. | `string` | n/a | yes |
| <a name="input_private_ssh_key_file_path"></a> [private\_ssh\_key\_file\_path](#input\_private\_ssh\_key\_file\_path) | Specifies the full path where the private SSH key file is located. | `string` | n/a | yes |

## Outputs

No outputs.
