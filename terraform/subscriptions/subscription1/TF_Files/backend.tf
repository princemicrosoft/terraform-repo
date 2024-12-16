terraform {
  backend "azurerm" {
    resource_group_name  = "prince-devops"
    storage_account_name = "princenstorageaccount"
    container_name       = "tfstatefiles"
    key                  = "PID-PIAterraform.tfstate"
    use_oidc             = true
    use_azuread_auth     = true
  }
}
