@echo off
set input_file=domainall.txt
set output_file=ipout.txt

cls
echo.
echo. 开始逐个检测，请等待 ...
echo.
:: 清空输出文件
type nul > %output_file%

powershell -Command "Get-Content %input_file% | ForEach-Object { [System.Net.Dns]::GetHostAddresses($_) | ForEach-Object { $_.IPAddressToString } } | Out-File %output_file%" 1>nul 2>nul

echo. 检测完成，结果已保存到 %output_file%
pause 1>nul 2>nul
