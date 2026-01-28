resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'cms01store'
  location: 'australiaeast'
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    accessTier: 'Hot'
      }
}

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-02-01' = {
  name: 'cms01store/default/cmscontainer'
  properties: {
    publicAccess: 'None'
  }
  dependsOn: [
    storageaccount
  ]
}

