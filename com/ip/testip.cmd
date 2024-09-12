@echo off
set input_file=ipall.txt
set output_file=cloudflare_import.txt
set port=1688
set domain=kms.jihuowin.com

cls
echo.
echo. 开始逐个检测，请等待 ...
echo.
:: 清空输出文件
type nul > %output_file%

:: 遍历ip每一行
for /f "tokens=*" %%i in (%input_file%) do (
    :: 使用 PowerShell 检测端口是否开放
    powershell -Command "Test-NetConnection -ComputerName %%i -Port %port%" | findstr "TcpTestSucceeded" > nul
    if %errorlevel% equ 0 (
        echo.
        echo. 检测 %%i 通过 ...
        echo %domain%.	1	IN	A	%%i>> %output_file%
    )
)

echo.
echo. 检测完成，结果已保存到 %output_file%
pause 1>nul 2>nul
