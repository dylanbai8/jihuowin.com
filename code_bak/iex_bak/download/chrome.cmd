@echo off
set self="%~f0"
set user=%USERPROFILE%
cd %user%

set url=https://gitee.com/dylanbai8/download/releases/download/8.8/ChromeSetup.exe

cls
echo.
echo.
echo. Downloading, please wait patiently ...
echo -------------------------------------------------
echo.
curl -L -o tool.exe %url%
tool.exe

del /q %self% 1>nul 2>nul
exit
