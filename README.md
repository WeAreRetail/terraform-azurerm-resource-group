# Azure Aware Resource Group

[![Build Status](https://dev.azure.com/weareretail/Tooling/_apis/build/status/mod_azu_resource_group?repoName=mod_azu_resource_group&branchName=master)](https://dev.azure.com/weareretail/Tooling/_build/latest?definitionId=2&repoName=mod_azu_resource_group&branchName=master)[![Unilicence](https://img.shields.io/badge/licence-The%20Unilicence-green)](LICENCE)

Common Azure Terraform module to create a Resource Group.

# Usage

```hcl
module "aware_tagging" {
  source = "WeAreRetail/tags/azurerm"

  geozone           = "France Central"
  budget            = "PRODUIT_A"
  project           = "PRJ"
  rgpd_personal     = true
  rgpd_confidential = false
  disaster_recovery = false
  environment       = "DEV"
  repository        = "my_pet_project"
}

module "aware_naming" {
  source = "WeAreRetail/naming/azurerm"

  location    = "France Central"
  environment = "DEV"
  project     = "PRJ"
  area        = "master"
}

module "aware_resource_group" {
  source = "WeAreRetail/resource-group/azurerm"

  tags         = module.aware_tagging.tags
  location     = "France Central"
  description  = "My Resource-group"
  caf_prefixes = module.aware_naming.resource_group_prefixes
}
```

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | >= 1.2.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=2.62.0 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure region to use for deployment. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource group tags. | `map(string)` | n/a | yes |
| <a name="input_caf_prefixes"></a> [caf\_prefixes](#input\_caf\_prefixes) | Prefixes to use for caf naming. | `list(string)` | `[]` | no |
| <a name="input_custom_name"></a> [custom\_name](#input\_custom\_name) | If defined, resource group custom name. | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | Resource group description. | `string` | `""` | no |
| <a name="input_name_separator"></a> [name\_separator](#input\_name\_separator) | Separator for CAF prefixes in name. | `string` | `""` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource group id |
| <a name="output_location"></a> [location](#output\_location) | Resource group location |
| <a name="output_name"></a> [name](#output\_name) | Resource group name |
<!-- END_TF_DOCS -->
