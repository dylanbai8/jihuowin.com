@echo off
set input_file=ipall.txt
set output_file=cloudflare_import.txt
set port=1688
set domain=kms.jihuowin.com

cls
echo.
echo. ��ʼ�����⣬��ȴ� ...
echo.
:: �������ļ�
type nul > %output_file%

:: ����ipÿһ��
for /f "tokens=*" %%i in (%input_file%) do (
    :: ʹ�� PowerShell ���˿��Ƿ񿪷�
    powershell -Command "Test-NetConnection -ComputerName %%i -Port %port%" | findstr "TcpTestSucceeded" > nul
    if %errorlevel% equ 0 (
        echo.
        echo. ��� %%i ͨ�� ...
        echo %domain%.	1	IN	A	%%i>> %output_file%
    )
)

echo.
echo. �����ɣ�����ѱ��浽 %output_file%
pause 1>nul 2>nul
