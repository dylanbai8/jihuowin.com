@echo off
set input_file=domainall.txt
set output_file=ipout.txt

cls
echo.
echo. ��ʼ�����⣬��ȴ� ...
echo.
:: �������ļ�
type nul > %output_file%

powershell -Command "Get-Content %input_file% | ForEach-Object { [System.Net.Dns]::GetHostAddresses($_) | ForEach-Object { $_.IPAddressToString } } | Out-File %output_file%" 1>nul 2>nul

echo. �����ɣ�����ѱ��浽 %output_file%
pause 1>nul 2>nul
