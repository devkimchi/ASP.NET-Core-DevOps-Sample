# Updates the version of project.json
function Update-PackageVersion([string]$ProjectPath, [int]$BuildNumber = 0)
{
	if ([String]::IsNullOrWhiteSpace($ProjectPath))
	{
		Write-Host "ProjectPath not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ($BuildNumber -le 0)
	{
		Write-Host "Invalid BuildNumber" -ForegroundColor White -BackgroundColor Red
		return
	}

	$project = Get-Content -Raw -Path $ProjectPath\project.json | ConvertFrom-Json
	$version = $project.version -replace "\.0$", ".$BuildNumber"

	$project.version = $version

	ConvertTo-Json $project -Depth 999 | Out-File $ProjectPath\project.json

	Remove-Variable project
	Remove-Variable version
}