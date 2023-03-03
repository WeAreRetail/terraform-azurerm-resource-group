locals {
  specific_tags = {
    "description" = var.description
  }

  tags = { for n, v in merge(var.tags, local.specific_tags) : n => v if v != "" }

  resource_name = coalesce(var.custom_name, azurecaf_name.self.result)
}

resource "azurecaf_name" "self" {
  name          = ""
  resource_type = "azurerm_resource_group"
  prefixes      = var.caf_prefixes
  suffixes      = []
  use_slug      = false
  clean_input   = true
  separator     = var.name_separator
}

resource "azurerm_resource_group" "self" {
  name     = local.resource_name
  location = var.location
  tags     = local.tags
}
