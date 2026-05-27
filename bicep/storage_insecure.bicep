// Intentionally insecure Azure Storage account. Do not deploy.

param location string = resourceGroup().location

resource insecureStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'iactestsinsecure'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    // BAD: allows plain HTTP
    supportsHttpsTrafficOnly: false
    // BAD: permits TLS 1.0
    minimumTlsVersion: 'TLS1_0'
    // BAD: public blob access enabled
    allowBlobPublicAccess: true
  }
}
