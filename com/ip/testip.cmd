@echo off
set input_file=aa.txt
set output_file=bb.txt
set port=1688

:: 清空输出文件
> %output_file%

:: 遍历 aa.txt 中的每一行
for /f "tokens=*" %%i in (%input_file%) do (
    :: 使用 PowerShell 检测端口是否开放
    powershell -Command "Test-NetConnection -ComputerName %%i -Port %port%" | findstr "TcpTestSucceeded" > nul
    if %errorlevel% equ 0 (
        echo %%i: 端口 %port% 是开放的 >> %output_file%
    ) else (
        echo %%i: 端口 %port% 是关闭的 >> %output_file%
    )
)

echo 检测完成，结果已保存到 %output_file%
pause
