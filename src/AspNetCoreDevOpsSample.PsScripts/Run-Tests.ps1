# Runs all test projects.
function Run-Tests([string]$VersionOrAlias, [string]$Runtime = "clr", [string]$Architecture = "x86", [string]$Os = "win")
{
	if ([String]::IsNullOrWhiteSpace($VersionOrAlias))
	{
		Write-Host "Version or alias not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	# Selects the runtime library.
	dnvm use $VersionOrAlias -r $Runtime -a $Architecture -os $Os

	# Restores the NuGet packages
	dnu restore -f https://www.myget.org/F/aspnet-contrib/api/v3/index.json

	# Builds ASP.NET Core projects only.
	$projects = Get-ChildItem .\test | ?{$_.PsIsContainer} | ?{ Test-Path (Join-Path $_.FullName "project.json") }
	foreach($project in $projects)
	{
		Write-Host "Testing $($project.Name)..." -ForegroundColor Green
		dnx -p $($project.FullName) test
	}

	Remove-Variable projects
}