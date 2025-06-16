# 🚀 Azure Quickstart Templates Bicep Templates

This repository contains 4 ready-to-deploy **Azure Bicep templates** designed for quick provisioning of production-grade, performance-focused cloud components.

Each template emphasizes **security**, **scalability**, and **real-world performance requirements**.

---

## 📁 Templates Included

### 1. `01-aks-standard.bicep`  
Provision an **Azure Kubernetes Service (AKS)** cluster with:
- Standard SKU load balancer for production-ready performance
- VMSS-based node pool (DS3_v2)
- System-assigned managed identity

### 2. `02-acr-private-endpoint.bicep`  
Deploy a **Premium Azure Container Registry (ACR)** with:
- Private endpoint for secure VNet access
- Public access disabled
- Deny-by-default firewall rules

### 3. `03-azure-function-premium.bicep`  
Create a **serverless Azure Function** with:
- Elastic Premium plan (EP1) for high throughput
- .NET 6 runtime on Linux
- Autoscaling enabled (up to 5 workers)

### 4. `04-appgw-waf-tier.bicep`  
Set up an **Application Gateway with WAF v2**:
- Autoscaling support
- HTTPS listener
- OWASP 3.2 rules in Prevention mode

---

## ✅ Requirements

- Azure CLI or Azure PowerShell
- Bicep CLI (`az bicep install`)
- Existing resource group and VNet (where required)
- Subscription with necessary RBAC permissions

---

## 🧪 How to Deploy

```bash
# Example: Deploy AKS
az deployment group create \
  --resource-group <your-rg> \
  --template-file 01-aks-standard.bicep
```

Update placeholder values inside the templates for:
- Subnet/resource IDs
- Region
- Naming conventions

---

## 💡 Why This Repo?

This set of templates is ideal for:
- Cloud engineers doing fast demos or POCs
- Technical Account Managers (TAMs) needing reproducible setups
- Interview preparation or GitHub profile activity
- Anyone building secure, scalable infrastructure on Azure

---

## 📌 License

MIT License. Use freely, contribute if you'd like!
