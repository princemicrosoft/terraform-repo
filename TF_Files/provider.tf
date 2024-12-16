provider "azurerm" {
  features {}
  storage_use_azuread = true
  use_oidc            = true
}

provider "azuread" {
  use_oidc = true

}

provider "azapi" {
  use_oidc = true
}

terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
      version = "2.1.0"
    }
  }
}