@echo off

SET DNX_FOLDER=dnx-clr-win-x64.1.0.0-rc1-update1
SET APP_ROOT_FOLDER=%HOME%\site\approot
SET DNX_PATH=%APP_ROOT_FOLDER%\runtimes\%DNX_FOLDER%\bin

%DNX_PATH%\dnx.exe ef database update -c SampleDbContext -p AspNetCoreDevOpsSample.Models
