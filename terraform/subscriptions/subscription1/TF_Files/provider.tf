terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
      version = "1.15.0"
    }
  }
}

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
