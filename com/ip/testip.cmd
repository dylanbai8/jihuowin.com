@echo off
set input_file=aa.txt
set output_file=bb.txt
set port=1688

:: �������ļ�
> %output_file%

:: ���� aa.txt �е�ÿһ��
for /f "tokens=*" %%i in (%input_file%) do (
    :: ʹ�� PowerShell ���˿��Ƿ񿪷�
    powershell -Command "Test-NetConnection -ComputerName %%i -Port %port%" | findstr "TcpTestSucceeded" > nul
    if %errorlevel% equ 0 (
        echo %%i: �˿� %port% �ǿ��ŵ� >> %output_file%
    ) else (
        echo %%i: �˿� %port% �ǹرյ� >> %output_file%
    )
)

echo �����ɣ�����ѱ��浽 %output_file%
pause
