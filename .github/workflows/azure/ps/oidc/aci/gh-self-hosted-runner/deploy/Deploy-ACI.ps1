#az login

#Variables
$randomInt = Get-Random -Maximum 9999
$aciResourceGroupName = "POC-ACI-GitHub-Runners-RG" #Resource group created to deploy ACIs
$aciName = "gh-runner-linux-$randomInt" #ACI name (unique)
$acrLoginServer = "registryName.azurecr.io" #The login server name of the ACR (all lowercase). Example: _myregistry.azurecr.io_
$acrUsername = "servicePrincipalClientId" #The `clientId` from the JSON output from the service principal creation (See part 3 of blog series)
$acrPassword = "servicePrincipalClientSecret" #The `clientSecret` from the JSON output from the service principal creation (See part 3 of blog series)
$image = "$acrLoginServer/az-ps-aci-gh-self-hosted-runner:latest" #image reference to pull
$pat = "githubPAT" #GitHub PAT token
$githubOrg = "HomeAidePi-Alpha" #GitHub Owner
$githubRepo = "feitss-az-ps-aci-gh-self-hosted-runner-linux" #GitHub repository to register self hosted runner against
$osType = "Linux" #Use "Windows" if image is Windows OS

az container create --resource-group "$aciResourceGroupName" `
    --name "$aciName" `
    --image "$image" `
    --registry-login-server "$acrLoginServer" `
    --registry-username "$acrUsername" `
    --registry-password "$acrPassword" `
    --environment-variables GH_TOKEN="$pat" GH_OWNER="$githubOrg" GH_REPOSITORY="$githubRepo" `
    --os-type "$osType"