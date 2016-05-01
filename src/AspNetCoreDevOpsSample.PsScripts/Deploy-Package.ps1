# Deploys the package
function Deploy-Package([string]$ResourceGroupName, [string]$ResourceName, [string]$PublishPath, [string]$AppName)
{
	if ([String]::IsNullOrWhiteSpace($ResourceGroupName))
	{
		Write-Host "ResourceGroupName not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($ResourceName))
	{
		Write-Host "ResourceName not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($PublishPath))
	{
		Write-Host "PublishPath not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($AppName))
	{
		Write-Host "AppName not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	# Downloads the applicatioin publish profile.
	$pubSettings = "$ResourceName.PublishSettings"

	$pubSettingsProfile = Get-AzureRmWebAppPublishingProfile -ResourceGroupName $ResourceGroupName -Name $ResourceName -OutputFile "$PublishPath\$pubSettings" -Format WebDeploy
	Write-Host "Publish settings downloaded" -ForegroundColor Green

	# Deployes the app to Azure Website.
	# Assumes that WAWSDeploy is installed at C:\WAWSDeploy.
	C:\WAWSDeploy\WAWSDeploy.exe "$PublishPath\$AppName" "$PublishPath\$pubSettings" /t "D:\home\site" /d
	$exitCode = $LASTEXITCODE

	if ($exitCode -ne 0)
	{
		Write-Host "Application deployment into $ResourceName failed!" -ForegroundColor White -BackgroundColor Red

		Remove-Variable pubSettings
		Remove-Variable pubSettingsProfile
		Remove-Variable exitCode

		return
	}

	Write-Host "Application deployed to $ResourceName.azurewebsites.net" -ForegroundColor Green

	Remove-Variable pubSettings
	Remove-Variable pubSettingsProfile
	Remove-Variable exitCode
}
