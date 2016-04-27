# Runs all JavaScript tests
function Run-JsTests([string]$VersionOrAlias, [string]$Runtime = "clr", [string]$Architecture = "x86", [string]$Os = "win", [string]$ChutzpahVersion)
{
	if ([String]::IsNullOrWhiteSpace($VersionOrAlias))
	{
		Write-Host "Version or alias not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	if ([String]::IsNullOrWhiteSpace($ChutzpahVersion))
	{
		Write-Host "ChutzpahVersion not provided" -ForegroundColor White -BackgroundColor Red
		return
	}

	# Selects the runtime library.
	dnvm use $VersionOrAlias -r $Runtime -a $Architecture -os $Os

	# Restores the NuGet packages
	dnu restore -f https://www.myget.org/F/aspnet-contrib/api/v3/index.json

	# Gets the Chutzpah test runner path.
	$chutzpah = "$env:USERPROFILE\.dnx\packages\Chutzpah\$ChutzpahVersion\tools\chutzpah.console.exe"

	# Builds ASP.NET Core projects only.
	$projects = Get-ChildItem .\test | ?{$_.PsIsContainer} | ?{ Test-Path (Join-Path $_.FullName "project.json") } | ?{ Test-Path (Join-Path $_.FullName "package.json") }
	foreach($project in $projects)
	{
		Write-Host "Testing $($project.Name)..." -ForegroundColor Green

		$jss = Get-ChildItem "$($project.FullName)\spec\javascripts\*.js"
		foreach($js in $jss)
		{
			Write-Host "Testing $($js)..." -ForegroundColor Green

			& $chutzpah /path $js
		}
	}

	Remove-Variable chutzpah
	Remove-Variable projects
	Remove-Variable jss
}