## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_mgc"></a> [mgc](#requirement\_mgc) | 0.18.10 |

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
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [time_sleep.wait_30_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | value | `string` | n/a | yes |
| <a name="input_additional_disk"></a> [additional\_disk](#input\_additional\_disk) | value | `any` | `{}` | no |
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | value | `bool` | `true` | no |
| <a name="input_create"></a> [create](#input\_create) | value | `bool` | `true` | no |
| <a name="input_delete_public_ip_on_destroy"></a> [delete\_public\_ip\_on\_destroy](#input\_delete\_public\_ip\_on\_destroy) | value | `bool` | `true` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | value | `string` | `"cloud-debian-12 LTS"` | no |
| <a name="input_machine_type_name"></a> [machine\_type\_name](#input\_machine\_type\_name) | value | `string` | `"cloud-bs1.small"` | no |
| <a name="input_name"></a> [name](#input\_name) | value | `string` | `""` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | value | `string` | `"vpc_default"` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | value | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | value |
| <a name="output_current_image_id"></a> [current\_image\_id](#output\_current\_image\_id) | value |
| <a name="output_current_machine_type_id"></a> [current\_machine\_type\_id](#output\_current\_machine\_type\_id) | value |
| <a name="output_current_machine_type_name"></a> [current\_machine\_type\_name](#output\_current\_machine\_type\_name) | value |
| <a name="output_current_name"></a> [current\_name](#output\_current\_name) | value |
| <a name="output_current_ssh_key_name"></a> [current\_ssh\_key\_name](#output\_current\_ssh\_key\_name) | value |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | value |
| <a name="output_status"></a> [status](#output\_status) | value |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | value |