@echo off

::��ȡ����ԱȨ��
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

::�����б�������������ɫ
title -- Ӱ��ϵͳ --
MODE con: COLS=53 lines=9
color 0a



::���˵�
:begin
cls
MODE con: COLS=53 lines=9
echo.
echo.          ===== Ӱ��ϵͳ =====
echo.
echo.   --[1]--���� Ӱ��ϵͳ
echo.   --[2]--�ر� Ӱ��ϵͳ
echo.
choice /c 12 /n /m "��ѡ��1-2����"

echo %errorlevel%
if %errorlevel% == 1 goto install
if %errorlevel% == 2 goto uninstall



::ж���Ҽ�
:uninstall
cls

uwfmgr filter disable

echo.
echo.
echo. �رճɹ���������Ч��
ping localhost -n 2 1>nul 2>nul
exit



::��װ�Ҽ�
:install
cls

uwfmgr filter enable

uwfmgr volume protect c:
uwfmgr file add-exclusion C:\Users\admin\Downloads

uwfmgr overlay set-size 2048
uwfmgr overlay set-warningthreshold 1848
uwfmgr overlay set-criticalthreshold 2000

echo.
echo.
echo. �����ɹ���������Ч��
ping localhost -n 2 1>nul 2>nul
exit




