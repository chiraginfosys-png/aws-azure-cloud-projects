param vmName string = 'cms001vm'
param location string = resourceGroup().location
param vmSize string = 'Standard_B1s'
param imagePublisher string = 'MicrosoftWindowsServer'
param imageOffer string = 'WindowsServer'
param imageSku string = '2022-Datacenter'
param imageVersion string = 'latest'
param adminUsername string
@secure()
param adminPassword string
param vnetName string = 'cmsVnet'
param subnetName string = 'cmsSubnet'
param nicName string = 'cmsNic'
param osDiskType string = 'Standard_LRS'
param osDiskSizeGB int = 127

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.1.0/24'
    }
  } 
  ]
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vnet.properties.subnets[0].id
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}

resource windowsVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
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
        name: 'CMSOsDisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
        diskSizeGB: osDiskSizeGB
      }
    }
      networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}
