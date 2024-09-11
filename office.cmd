@echo off
set self="%~f0"
set user=%USERPROFILE%
cd %user%

set url=https://c2rsetup.officeapps.live.com/c2r/download.aspx?productReleaseID=O365BusinessRetail&platform=X64&language=zh-cn

cls
echo.
echo.
echo. Downloading, please wait patiently ...
echo -------------------------------------------------
echo.
curl -L -o tool.exe %url% && tool.exe

del /q %user%\tool.exe 1>nul 2>nul
del /q %self% 1>nul 2>nul
exit
