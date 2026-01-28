param sqlServerName string = 'cms01sqlserver'
param location string = resourceGroup().location
param administratorLogin string = 'sqladmin'
@secure()
param administratorLoginPassword string 
param publicNetworkAccess string = 'Enabled'
param databaseName string = 'cms01database'
param skuName string = 'Basic'
param maxSizeBytes int = 2147483648
param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param zoneRedundant bool = false

resource sqlServer 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    publicNetworkAccess: publicNetworkAccess
  }
  sku: {
    name: skuName
    tier: 'Basic'
    capacity: 5
  }
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2021-02-01-preview' = {
  name: '${sqlServer.name}/${databaseName}'
  location: location
  properties: {
    collation: collation
    maxSizeBytes: maxSizeBytes
    zoneRedundant: zoneRedundant
  }
  sku: {
    name: skuName
    tier: 'Basic'
    capacity: 5
  }
}
