# Publishes the application package.
function Publish-Package([string]$VersionOrAlias, [string]$Runtime = "clr", [string]$Architecture = "x86", [string]$Os = "win")
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

	# Gets the current path.
	$pwd = pwd

	# Publishes the application projects only.
	$projects = Get-ChildItem .\src | ?{ $_.PSIsContainer } | ?{ Test-Path -Path (Join-Path $_.FullName "Startup.cs") }
	foreach ($project in $projects)
	{
		dnu publish $project.FullName --out "C:\Temp\publish\$($project.Name)" --configuration Release --runtime dnx-clr-win-x64.1.0.0-rc1-update1 --wwwroot "wwwroot" --wwwroot-out "wwwroot" --iis-command "web"
	}

	Remove-Variable pwd
	Remove-Variable projects
}