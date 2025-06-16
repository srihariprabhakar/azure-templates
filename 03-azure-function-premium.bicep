param funcName string = 'quickfunc'
param location string = resourceGroup().location

resource hostingPlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: '${funcName}-plan'
  location: location
  sku: {
    name: 'EP1'
    tier: 'ElasticPremium'
  }
  properties: {
    maximumElasticWorkerCount: 5
  }
}

resource funcApp 'Microsoft.Web/sites@2022-09-01' = {
  name: funcName
  location: location
  kind: 'functionapp'
  properties: {
    serverFarmId: hostingPlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'DOTNET|6.0'
    }
  }
}
