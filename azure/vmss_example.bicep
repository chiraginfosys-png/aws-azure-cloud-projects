param vmssName string
param location string = resourceGroup().location
param instanceCount int = 2
param vmSize string = 'Standard_B2s'

param adminUsername string
@secure()
param adminPassword string

// Networking params (create VNet/Subnet)
param vnetName string = '${vmssName}-vnet'
param subnetName string = 'default'
param vnetAddressPrefix string = '10.10.0.0/16'
param subnetPrefix string = '10.10.1.0/24'

// Image params
param imagePublisher string = 'Canonical'
param imageOffer string = '0001-com-ubuntu-server-focal'
param imageSku string = '20_04-lts'
param imageVersion string = 'latest'

resource vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

resource vmss 'Microsoft.Compute/virtualMachineScaleSets@2023-07-01' = {
  name: vmssName
  location: location
  sku: {
    name: vmSize
    capacity: instanceCount
  }
  properties: {
    upgradePolicy: {
      mode: 'Automatic'
    }
    virtualMachineProfile: {
      osProfile: {
        computerNamePrefix: vmssName
        adminUsername: adminUsername
        adminPassword: adminPassword
      }
      storageProfile: {
        imageReference: {
          publisher: imagePublisher
          offer: imageOffer
          sku: imageSku
          version: imageVersion
        }
        osDisk: {
          createOption: 'FromImage'
          managedDisk: {
            storageAccountType: 'Standard_LRS'
          }
        }
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: 'nicConfig'
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: 'ipConfig'
                  properties: {
                    subnet: {
                      id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet.name, subnetName)
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }
  }
}
