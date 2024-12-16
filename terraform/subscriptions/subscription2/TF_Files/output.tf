# Network Security Group (NSG) Output
output "network_security_group_name" {
  value       = var.enable_nsg ? module.avm-res-network-networksecuritygroup[0].name : null
  description = "The name of the Network Security Group"
}

output "network_security_group_id" {
  value       = var.enable_nsg ? module.avm-res-network-networksecuritygroup[0].resource_id : null
  description = "The ID of the Network Security Group"
}

# Virtual Network (VNet) Output
output "virtual_network_name" {
  value       = var.enable_vnet ? module.avm-res-network-virtualnetwork[0].name : null
  description = "The name of the Virtual Network"
}

output "virtual_network_id" {
  value       = var.enable_vnet ? module.avm-res-network-virtualnetwork[0].resource_id : null
  description = "The ID of the Virtual Network"
}

# Managed Identity Output
output "managed_identity_name" {
  value       = var.enable_managed_identity ? module.avm-res-managedidentity-userassignedidentity[0].resource_name : null
  description = "The name of the Managed Identity"
}

output "managed_identity_id" {
  value       = var.enable_managed_identity ? module.avm-res-managedidentity-userassignedidentity[0].resource_id : null
  description = "The ID of the Managed Identity"
}

# Storage Account Output
output "storage_account_name" {
  value       = var.enable_storage_account ? module.avm-res-storage-storageaccount[0].name : null
  description = "The name of the Storage Account"
}

output "storage_account_id" {
  value       = var.enable_storage_account ? module.avm-res-storage-storageaccount[0].resource_id : null
  description = "The ID of the Storage Account"
}

# Recovery Vault Output
output "recovery_vault_name" {
  value       = var.enable_recovery_vault ? module.avm-res-recoveryservices-vault[0].resource : null
  description = "The name of the Recovery Vault"
}

output "recovery_vault_id" {
  value       = var.enable_recovery_vault ? module.avm-res-recoveryservices-vault[0].resource_id : null
  description = "The ID of the Recovery Vault"
}

# Management Lock Output (only if the lock is enabled)
output "management_lock_name" {
  value       = var.enable_management_lock ? azurerm_management_lock.resource-group-level[0].name : null
  description = "The name of the Management Lock"
}

output "management_lock_id" {
  value       = var.enable_management_lock ? azurerm_management_lock.resource-group-level[0].id : null
  description = "The ID of the Management Lock"
}

output "management_lock_scope" {
  value       = var.enable_management_lock ? azurerm_management_lock.resource-group-level[0].scope : null
  description = "The scope of the Management Lock"
}
