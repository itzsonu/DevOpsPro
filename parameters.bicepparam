
using './main.bicep'
// Key Vault names must be globally unique.
param keyVaultName = 'kvtd20260828'
// Managed Identity name
param identityName = 'kv-demo-identity'
// Azure location
param location = 'centralindia'
