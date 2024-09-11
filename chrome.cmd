@echo off
cd /d "%~dp0"
set self="%~f0"
set user=%USERPROFILE%
cd %user%

set url=https://gitee.com/dylanbai8/download/releases/download/8.8/ChromeSetup.exe

cls
echo.
echo.
echo. 下载中，请耐心等待 ...
echo -------------------------------------------------
echo.
curl -L -o tool.exe %url% && tool.exe

del /q %user%\tool.exe 1>nul 2>nul
del /q %self% 1>nul 2>nul
exit
