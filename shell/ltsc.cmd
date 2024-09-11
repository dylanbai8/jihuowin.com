@echo off
cd /d "%~dp0"
set self="%~f0"
set user=%USERPROFILE%
cd %user%

set exe_url=https://gitee.com/dylanbai8/download/releases/download/21.0/setup.exe
set config_url=https://gitee.com/dylanbai8/download/releases/download/22.0/config_full.xml

cls
echo.
echo. Office LTSC Professional Plus 2021
echo -------------------------------------------------
echo.
echo.
curl -L -o setup.exe %exe_url%
echo.
echo.
curl -L -o config.xml %config_url%
echo.
echo.
echo. Start the installation process
echo -------------------------------------------------
echo.
echo. It will take a long time , please wait ...
echo.
echo. Wroking ...
echo. [2GB] Package Downloading ...
echo.
echo. Installing ...
echo. Keep me, don't close !
echo. Just Waiting ... Working ...
echo.
echo.
echo.
%user%\setup.exe /configure %user%\config.xml
echo -------------------------------------------------
echo.
echo. All done, you can close cmd now !
timeout 10
echo.
echo.
echo.

del %user%\setup.exe 1>nul 2>nul
del %user%\config.xml 1>nul 2>nul
rmdir /s /q %user%\Office 1>nul 2>nul
del /q %self% 1>nul 2>nul

:: https://config.office.com/deploymentsettings
:: https://learn.microsoft.com/zh-cn/deployoffice/overview-office-deployment-tool


