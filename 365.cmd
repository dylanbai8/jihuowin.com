@echo off
cd /d "%~dp0"
set kmsserver=kms.jihuowin.com

chcp 437 >nul
openfiles >nul 2>&1
if %errorlevel% NEQ 0 goto :UACPrompt
goto :GetOffice

:UACPrompt
Echo CreateObject^("Shell.Application"^).ShellExecute WScript.Arguments^(0^),"%*","","runas",1 >"%temp%\elevating.vbs"
%systemroot%\system32\cscript.exe //nologo "%temp%\elevating.vbs" "%~dpnx0"
del /f /q "%temp%\elevating.vbs" >nul 2>&1
exit /b

:GetOffice
for /f "tokens=2 delims==" %%1 in ('assoc .doc')do (
    for /f "tokens=2 delims==" %%2 in ('ftype %%1')do (
        for %%3 in (%%2)do (if not defined get_path set get_path=%%~dp3
        )
    )
)
if not defined get_path goto :error

call set "office_path=%%get_path:root\=%%"
call set "licen_path=%%get_path:\Office=\Licenses%%"
set ospp_path=%office_path%OSPP.VBS

if not exist "%licen_path%" goto :error
if not exist "%ospp_path%" goto :error

cls
echo.
echo. Convert to Office LTSC Professional Plus 2021
echo -------------------------------------------------
echo.
echo. Installing root certificate !
echo.
echo. Working ...
echo.
for /f %%x in ('dir /b "%licen_path%proplusvl_kms*.xrm-ms"') do cscript "%ospp_path%" /inslic:"%licen_path%%%x" 1>nul 2>nul
for /f %%x in ('dir /b "%licen_path%proplusvl_mak*.xrm-ms"') do cscript "%ospp_path%" /inslic:"%licen_path%%%x" 1>nul 2>nul

echo. I need some time , Just wait patiently ...
echo.
cscript "%ospp_path%" /unpkey:3RQ6B 1>nul 2>nul
cscript "%ospp_path%" /unpkey:T3CPT 1>nul 2>nul
cscript "%ospp_path%" /unpkey:KHGM9 1>nul 2>nul
cscript "%ospp_path%" /unpkey:VMFTK 1>nul 2>nul
cscript "%ospp_path%" /unpkey:H499R 1>nul 2>nul
:: https://github.com/YerongAI/Office-Tool/blob/main/doc/Tech%20Articles/Products.md

cscript "%ospp_path%" /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH 1>nul 2>nul
cscript "%ospp_path%" /sethst:%kmsserver% 1>nul 2>nul

echo.
echo. Office Activate
echo -------------------------------------------------
echo.
echo. Working ...
echo.
echo.
cscript "%ospp_path%" /act
echo.
echo.

:end
echo -------------------------------------------------
echo.
echo. All done, you can close cmd now !
echo.
echo.
echo.
del /q "%~f0" 1>nul 2>nul

:error
echo.
echo -------------------------------------------------
echo.
echo. Error! Did you install Office incorrectly ?
echo.
echo.
echo.
del /q "%~f0" 1>nul 2>nul


