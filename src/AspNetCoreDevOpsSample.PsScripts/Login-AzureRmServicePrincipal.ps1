# Login to Azure RM with service principal.
# If both ClientSecret and SecureClientSecret are provided, ClientSecret will be ignored.
function Login-AzureRmServicePrincipal([string]$TenantId, [string]$ClientId, [string]$ClientSecret, [System.Security.SecureString]$SecureClientSecret)
{
	if ([String]::IsNullOrWhiteSpace($TenantId))
	{
		Write-Host "TenantId not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($ClientId))
	{
		Write-Host "ClientId not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($ClientSecret) -and $SecureClientSecret -eq $null)
	{
		Write-Host "Neither ClientSecret nor SecureClientSecret provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if (![String]::IsNullOrWhiteSpace($ClientSecret))
	{
		$password = ConvertTo-SecureString $ClientSecret -AsPlainText -Force
	}

	if ($SecureClientSecret -ne $null)
	{
		$password = $SecureClientSecret
	}

	$credential = New-Object System.Management.Automation.PSCredential ($ClientId, $password)

	Login-AzureRmAccount -ServicePrincipal -Tenant $TenantId -Credential $credential

	Remove-Variable password
	Remove-Variable credential
}
