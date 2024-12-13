provider "azurerm" {
  features {}
  storage_use_azuread = true
  use_oidc            = true
  subscription_id     = var.subscription_id
}

provider "azuread" {
  use_oidc = true

}