#Log into Azure
#az login

# Setup Variables.
$resourceGroupName = "POC-Azure-Container-Registry"
$region = "eastus2"
$acrName = "pocacrregistry"

# Create a resource resourceGroupName
az group create --name "$resourceGroupName" --location "$region"

# Create an ACR (Basic)
az acr create --resource-group "$resourceGroupName" `
    --name "$acrName" `
    --sku "Basic" `
    --admin-enabled "false"