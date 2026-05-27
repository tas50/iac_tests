// Hardened Azure Storage account counterpart. Should pass clean.

param location string = resourceGroup().location

resource secureStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'iactestssecure'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    networkAcls: {
      defaultAction: 'Deny'
    }
  }
}
