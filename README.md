## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_mgc"></a> [mgc](#requirement\_mgc) | 0.18.10 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.2 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.11.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mgc"></a> [mgc](#provider\_mgc) | 0.18.10 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.11.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [mgc_block-storage_volume-attachment.this](https://registry.terraform.io/providers/MagaluCloud/mgc/0.18.10/docs/resources/block-storage_volume-attachment) | resource |
| [mgc_block-storage_volumes.this](https://registry.terraform.io/providers/MagaluCloud/mgc/0.18.10/docs/resources/block-storage_volumes) | resource |
| [mgc_virtual-machine_instances.this](https://registry.terraform.io/providers/MagaluCloud/mgc/0.18.10/docs/resources/virtual-machine_instances) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/3.6.2/docs/resources/pet) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/3.6.2/docs/resources/string) | resource |
| [time_sleep.wait_30_seconds](https://registry.terraform.io/providers/hashicorp/time/0.11.1/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Name of the registered public key | `string` | n/a | yes |
| <a name="input_additional_disk"></a> [additional\_disk](#input\_additional\_disk) | Disks that will be additionally attached to the virtual machine, the structure is a map of maps | `any` | `{}` | no |
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | Defines whether the public IP should be created and attached to the virtual machine | `bool` | `true` | no |
| <a name="input_create"></a> [create](#input\_create) | Defines whether the virtual machine was created or not | `bool` | `true` | no |
| <a name="input_delete_public_ip_on_destroy"></a> [delete\_public\_ip\_on\_destroy](#input\_delete\_public\_ip\_on\_destroy) | Defines whether the created public ip should be deleted when the virtual machine is deleted | `bool` | `true` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | value | `string` | `"cloud-ubuntu-22.04 LTS"` | no |
| <a name="input_machine_type_name"></a> [machine\_type\_name](#input\_machine\_type\_name) | Name of the image to use to create the virtual machine | `string` | `"cloud-bs1.small"` | no |
| <a name="input_name"></a> [name](#input\_name) | Defines the name of the virtual machine and must be unique | `string` | `""` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the VPC where the virtual machine will run | `string` | `"vpc_default"` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Shell script text file | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_associate_public_ip"></a> [associate\_public\_ip](#output\_associate\_public\_ip) | Boolean value, whether there is a public IP or not: true or false |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | Timestamp of when the virtual machine was created |
| <a name="output_current_image_id"></a> [current\_image\_id](#output\_current\_image\_id) | ID of the image used in the virtual machine |
| <a name="output_current_machine_type_id"></a> [current\_machine\_type\_id](#output\_current\_machine\_type\_id) | Instance type ID used |
| <a name="output_current_machine_type_name"></a> [current\_machine\_type\_name](#output\_current\_machine\_type\_name) | Name of the instance type used |
| <a name="output_current_name"></a> [current\_name](#output\_current\_name) | Virtual machine name |
| <a name="output_current_ssh_key_name"></a> [current\_ssh\_key\_name](#output\_current\_ssh\_key\_name) | Name of the ssh key used |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | ID of the created virtual machine |
| <a name="output_status"></a> [status](#output\_status) | Status of the virtual machine created, running, stopped, etc. |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | Timestamp of last modified virtual machine |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | VPC being used by the virtual machine |