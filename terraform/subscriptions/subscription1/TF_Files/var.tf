# Flag to enable or disable the resource group creation
variable "enable_resource_group" {
  description = "Flag to enable or disable the resource group creation."
  type        = bool
  default     = true
}

# Flag to enable or disable the Network Security Group creation
variable "enable_nsg" {
  description = "Flag to enable or disable the Network Security Group creation."
  type        = bool
  default     = true
}

# Flag to enable or disable the Virtual Network creation
variable "enable_vnet" {
  description = "Flag to enable or disable the Virtual Network creation."
  type        = bool
  default     = true
}

# Flag to enable or disable the Managed Identity creation
variable "enable_managed_identity" {
  description = "Flag to enable or disable the Managed Identity creation."
  type        = bool
  default     = true
}

# Flag to enable or disable the Storage Account creation
variable "enable_storage_account" {
  description = "Flag to enable or disable the Storage Account creation."
  type        = bool
  default     = true
}

# Flag to enable or disable the Recovery Services Vault creation
variable "enable_recovery_vault" {
  description = "Flag to enable or disable the Recovery Services Vault creation."
  type        = bool
  default     = true
}

# Flag to enable or disable the Backup Container creation
variable "enable_backup_container" {
  description = "Flag to enable or disable the Backup Container creation."
  type        = bool
  default     = true
}

# Flag to enable or disable the Management Lock creation
variable "enable_management_lock" {
  description = "Flag to enable or disable the Management Lock creation."
  type        = bool
  default     = true
}

variable "enable_budget" {
  description = "Flag to enable or disable the budget creation."
  type        = bool  
}

# Subscription ID
variable "subscription_id" {
  description = "Subscription ID."
  type        = string
}

# Location for the resources
variable "location" {
  description = "Location for the resources."
  type        = string
}

# Address space for the Virtual Network
variable "address_space" {
  description = "Address space for the Virtual Network."
  type        = list(string)
}

# Name of the Storage Account
variable "storageaccount_name" {
  description = "Name of the Storage Account."
  type        = string
}

# Flag to enable or disable cross-region Recovery Vault
variable "recovery_vault_cross_region" {
  description = "Flag to enable or disable cross-region Recovery Vault."
  type        = bool
}

# SKU for the Recovery Vault
variable "recovery_vault_sku" {
  description = "SKU for the Recovery Vault."
  type        = string
}

# Tags for the resources
variable "tags" {
  description = "Tags for the resources."
  type        = map(string)
  default     = {}
}

# Name of the Management Lock
variable "lock_name" {
  description = "Name of the Management Lock."
  type        = string
}

# Level of the Management Lock
variable "lock_level" {
  description = "Level of the Management Lock."
  type        = string
}

# Notes for the Management Lock
variable "lock_notes" {
  description = "Notes for the Management Lock."
  type        = string
}

# Name of the Resource Group budget
variable "rg_budget_name" {
  description = "Name of the Resource Group budget."
  type        = string
}

# List of recipient email addresses
variable "receipient_mail" {
  description = "List of recipient email addresses."
  type        = list(string)
}

# Suffix for the resource names
variable "name_suffix" {
  description = "Suffix for the resource names."
  type        = list(string)
}