//Resource Provisioning Template 

@description('Name of the Azure Storage Account')
param storageAccountName string

@description('Azure deployment location')
param location string = resourceGroup().location   // fixed: '-' was invalid, must be '=' for default value assignment

//Azure Storage Account 
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {   // fixed: typo 'stroageAccount' -> 'storageAccount'; comma -> dot in 'Microsoft,Storage' -> 'Microsoft.Storage'; missing '=' before '{' added
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {                          // fixed typo: 'peroperties' -> 'properties'
    accessTier: 'Hot'
    allowBlobPublicAccess: false         // fixed: 'allowBlobpublicAccess' casing wrong + wrong value type. This property expects bool (true/false), not loadFileAsBase64(). Set to false (best practice - blocks public blob access)
    minimumTlsVersion: 'TLS1_2'          // added: 'minimumTls' was an undefined variable being passed into a base64 file loader (nonsensical) - this is what you likely meant: enforce TLS 1.2 minimum
  }
}
