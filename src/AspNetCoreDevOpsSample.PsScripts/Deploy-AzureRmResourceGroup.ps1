# Deployes Azure resources to the given Azure Resource Group.
function Deploy-AzureRmResourceGroup([string]$ResourceGroupName, `
	                                 [string]$ResourceGroupLocation, `
									 [string]$ResourceGroupDeploymentName, `
	                                 [string]$TemplateFilePath, `
	                                 [string]$ParameterFilePath)
{
	if ([String]::IsNullOrWhiteSpace($ResourceGroupName))
	{
		Write-Host "ResourceGroupName not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($ResourceGroupLocation))
	{
		Write-Host "ResourceGroupLocation not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($ResourceGroupDeploymentName))
	{
		Write-Host "ResourceGroupDeploymentName not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($TemplateFilePath))
	{
		Write-Host "TemplateFilePath not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($ParameterFilePath))
	{
		Write-Host "ParameterFilePath not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	# Creates resource group.
	Write-Host "Creating Azure Resource Group..."
	New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation -Force
	Write-Host "Azure Resource Group $ResourceGroupName in $ResourceGroupLocation created." -ForegroundColor Green

	# Deploys Azure resources.
	Write-Host "Deploying Azure Resource Group Template..."
	New-AzureRmResourceGroupDeployment `
		-ResourceGroupName $ResourceGroupName `
		-Name $ResourceGroupDeploymentName `
		-TemplateFile $TemplateFilePath `
		-TemplateParameterFile $ParameterFilePath `
		-Verbose
}