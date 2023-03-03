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

module "aware_resource_group" {
  source = "WeAreRetail/resource-group/azurerm"

  tags         = module.aware_tagging.tags
  location     = "France Central"
  description  = "Test resource group"
  custom_name  = "Custom name"
  caf_prefixes = module.aware_naming.resource_group_prefixes
}
