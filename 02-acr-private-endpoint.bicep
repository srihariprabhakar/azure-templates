param acrName string = 'acrquickstart'
param location string = resourceGroup().location

resource acr 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: 'Premium'
  }
  properties: {
    publicNetworkAccess: 'Disabled'
    networkRuleSet: {
      defaultAction: 'Deny'
    }
  }
}

resource acrPe 'Microsoft.Network/privateEndpoints@2023-05-01' = {
  name: '${acrName}-pe'
  location: location
  properties: {
    subnet: {
      id: '/subscriptions/<subId>/resourceGroups/<rgName>/providers/Microsoft.Network/virtualNetworks/<vnetName>/subnets/<subnetName>'
    }
    privateLinkServiceConnections: [
      {
        name: '${acrName}-plsc'
        properties: {
          privateLinkServiceId: acr.id
          groupIds: ['registry']
        }
      }
    ]
  }
}
