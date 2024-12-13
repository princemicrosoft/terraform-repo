# Module for naming resources
module "naming" {
  source = "Azure/naming/azurerm"
  suffix = var.name_suffix
}

# Azure AD Group for the development team
# resource "azuread_group" "dev_team" {
#   display_name     = "DEV_TEAM"
#   security_enabled = true
#   mail_enabled     = false
# }
# data "azuread_group" "group" {
#   display_name = "DEV_TEAM"
# }
locals {
  group_object_id = "8e70d712-d73d-491f-b168-1a8d552aaedc"
}

# Module for creating a resource group
module "avm-res-resources-resourcegroup" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.1.0"
  name     = module.naming.resource_group.name
  location = var.location
  tags     = var.tags
  role_assignments = {
    "roleassignment1" = {
      principal_id               = local.group_object_id
      role_definition_id_or_name = "Reader"
    }
  }
}

# Module for creating a Network Security Group (NSG)
module "avm-res-network-networksecuritygroup" {
  source              = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version             = "0.2.0"
  name                = module.naming.network_security_group.name
  location            = var.location
  resource_group_name = module.avm-res-resources-resourcegroup.name
  tags                = var.tags
  count               = var.enable_nsg ? 1 : 0
}

# Module for creating a Virtual Network (VNet)
module "avm-res-network-virtualnetwork" {
  source              = "Azure/avm-res-network-virtualnetwork/azurerm"
  version             = "0.7.1"
  name                = module.naming.virtual_network.name
  address_space       = var.address_space
  resource_group_name = module.avm-res-resources-resourcegroup.name
  location            = var.location
  tags                = var.tags
  count               = var.enable_vnet ? 1 : 0
}

# Module for creating a Managed Identity
module "avm-res-managedidentity-userassignedidentity" {
  source              = "Azure/avm-res-managedidentity-userassignedidentity/azurerm"
  version             = "0.3.3"
  name                = module.naming.user_assigned_identity.name
  resource_group_name = module.avm-res-resources-resourcegroup.name
  location            = var.location
  tags                = var.tags
  count               = var.enable_managed_identity ? 1 : 0
}

# Role assignment for the Managed Identity
resource "azurerm_role_assignment" "role_assignment2" {
  principal_id         = module.avm-res-managedidentity-userassignedidentity[0].principal_id
  role_definition_name = "Contributor"
  scope                = module.avm-res-resources-resourcegroup.resource_id
  depends_on           = [module.avm-res-managedidentity-userassignedidentity]
}

# Module for creating a Storage Account
module "avm-res-storage-storageaccount" {
  source              = "Azure/avm-res-storage-storageaccount/azurerm"
  version             = "0.2.7"
  name                = var.storageaccount_name
  resource_group_name = module.avm-res-resources-resourcegroup.name
  location            = var.location
  tags                = var.tags
  count               = var.enable_storage_account ? 1 : 0
  role_assignments = {
    "roleassignment1" = {
      principal_id               = data.azuread_group.group.object_id
      role_definition_id_or_name = "Storage Blob Data Reader"
    }
  }
}

# Module for creating a Recovery Services Vault
module "avm-res-recoveryservices-vault" {
  source                       = "git::https://github.com/Azure/terraform-azurerm-avm-res-recoveryservices-vault.git"
  name                         = module.naming.recovery_services_vault.name
  resource_group_name          = module.avm-res-resources-resourcegroup.name
  location                     = var.location
  cross_region_restore_enabled = var.recovery_vault_cross_region
  sku                          = var.recovery_vault_sku
  count                        = var.enable_recovery_vault ? 1 : 0
}

# Management Lock for the resource group
resource "azurerm_management_lock" "resource-group-level" {
  name       = var.lock_name
  scope      = module.avm-res-resources-resourcegroup.resource_id
  lock_level = var.lock_level
  notes      = var.lock_notes
  count      = var.enable_management_lock ? 1 : 0
}

# Budget for the resource group
resource "azurerm_consumption_budget_resource_group" "segittur_rg_budget" {
  name              = var.rg_budget_name
  resource_group_id = module.avm-res-resources-resourcegroup.resource_id

  amount     = 4000
  time_grain = "Monthly"

  time_period {
    start_date = "2024-12-01T00:00:00Z"
    end_date   = "2025-12-31T23:59:59Z"
  }

  notification {
    enabled        = true
    threshold      = 50.0
    operator       = "GreaterThanOrEqualTo"
    threshold_type = "Forecasted"
    contact_emails = var.receipient_mail
    contact_roles  = ["Owner"]
  }

  notification {
    enabled        = true
    threshold      = 75.0
    operator       = "GreaterThanOrEqualTo"
    threshold_type = "Forecasted"
    contact_emails = var.receipient_mail
    contact_roles  = ["Owner"]
  }

  notification {
    enabled        = true
    threshold      = 90.0
    operator       = "GreaterThanOrEqualTo"
    threshold_type = "Forecasted"
    contact_emails = var.receipient_mail
    contact_roles  = ["Owner"]
  }
}
