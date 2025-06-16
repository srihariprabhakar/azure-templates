param appGwName string = 'quickappgw'
param location string = resourceGroup().location

resource appGw 'Microsoft.Network/applicationGateways@2023-05-01' = {
  name: appGwName
  location: location
  sku: {
    name: 'WAF_v2'
    tier: 'WAF_v2'
    capacity: 2
  }
  properties: {
    gatewayIPConfigurations: [
      {
        name: 'appGwIpConfig'
        properties: {
          subnet: {
            id: '/subscriptions/<subId>/resourceGroups/<rgName>/providers/Microsoft.Network/virtualNetworks/<vnetName>/subnets/<subnetName>'
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGwFrontendIP'
        properties: {
          publicIPAddress: {
            id: '/subscriptions/<subId>/resourceGroups/<rgName>/providers/Microsoft.Network/publicIPAddresses/<pipName>'
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'appGwFrontendPort'
        properties: {
          port: 443
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'appGwBackendPool'
      }
    ]
    httpListeners: [
      {
        name: 'appGwListener'
        properties: {
          frontendIPConfiguration: {
            id: '${appGw.id}/frontendIPConfigurations/appGwFrontendIP'
          }
          frontendPort: {
            id: '${appGw.id}/frontendPorts/appGwFrontendPort'
          }
          protocol: 'Https'
        }
      }
    ]
    wafConfiguration: {
      enabled: true
      firewallMode: 'Prevention'
      ruleSetType: 'OWASP'
      ruleSetVersion: '3.2'
    }
  }
}
