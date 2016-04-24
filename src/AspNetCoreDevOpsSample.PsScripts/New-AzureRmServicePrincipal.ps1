# Creates a new service principal.
function New-AzureRmServicePrincipal([string]$SubscriptionId, [string]$ClientId, [string]$ResourceGroupName)
{
	if ([String]::IsNullOrWhiteSpace($ClientId))
	{
		Write-Host "ClientId not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	Login-AzureRmAccount

	# If subscriptionId is not provided, just use the default subscriptionId.
	if (![String]::IsNullOrWhiteSpace($SubscriptionId))
	{
		Select-AzureRmSubscription -SubscriptionId $SubscriptionId
	}

	# If resource group name is provided, servicce principal is only scoped to the resource group;
	# otherwise it is scoped to the subscriptionId.
	if (![String]::IsNullOrWhiteSpace($ResourceGroupName))
	{
		New-AzureRmRoleAssignment -ServicePrincipalName $ClientId -RoleDefinitionName "Contributor" -ResourceGroupName $ResourceGroupName

		Write-Host "Service Principal created to $ResourceGroupName" -ForegroundColor Green
	}
	else
	{
		New-AzureRmRoleAssignment -ServicePrincipalName $ClientId -RoleDefinitionName "Contributor"

		Write-Host "Service Principal created" -ForegroundColor Green
	}
}
