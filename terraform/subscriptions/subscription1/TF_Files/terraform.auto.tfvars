# Feature Flags
enable_resource_group   = true
enable_nsg              = true
enable_vnet             = true
enable_managed_identity = true
enable_storage_account  = true
enable_recovery_vault   = true
enable_backup_container = true
enable_management_lock  = false
enable_budget = true

# Subscription ID
subscription_id = "336349dc-0fa5-48a3-ba28-c0d327bab5bc"

# Location for the resources
location = "East US"

# Suffix for the resource namesz
name_suffix = ["segittur", "dev-pid-pia"]

# Address space for the Virtual Network
address_space = ["10.0.0.0/16"]

# Name of the Storage Account
storageaccount_name = "segitturstadevpidpia"

# Recovery Vault settings
recovery_vault_cross_region = false
recovery_vault_sku          = "RS0"

# Tags for the resources
tags = {
  environment = "dev-pid-pia"
  project     = "Segittur"
}

# Management Lock settings
lock_name  = "Segittur-resource-group-level-pid-pia"
lock_level = "CanNotDelete"
lock_notes = "This Resource Group is Read-Only"

# Resource Group budget settings
rg_budget_name = "segittur-rg-budget"

# List of recipient email addresses
receipient_mail = ["princeninawe@microsoft.com", "walter.grasselli@microsoft.com"]