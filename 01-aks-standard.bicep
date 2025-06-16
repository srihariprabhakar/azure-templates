param clusterName string = 'aksQuickstart'
param location string = resourceGroup().location

resource aks 'Microsoft.ContainerService/managedClusters@2024-01-01' = {
  name: clusterName
  location: location
  sku: {
    name: 'Basic'
    tier: 'Free'
  }
  properties: {
    dnsPrefix: 'aksdemo'
    agentPoolProfiles: [
      {
        name: 'nodepool1'
        count: 2
        vmSize: 'Standard_DS3_v2'
        type: 'VirtualMachineScaleSets'
        mode: 'System'
        osType: 'Linux'
      }
    ]
    networkProfile: {
      networkPlugin: 'azure'
      loadBalancerSku: 'standard'
    }
    identity: {
      type: 'SystemAssigned'
    }
  }
}
