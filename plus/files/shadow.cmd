@echo off

::获取管理员权限
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

::命令行标题栏和文字颜色
title -- 影子系统 --
MODE con: COLS=53 lines=9
color 0a



::主菜单
:begin
cls
MODE con: COLS=53 lines=9
echo.
echo.          ===== 影子系统 =====
echo.
echo.   --[1]--开启 影子系统
echo.   --[2]--关闭 影子系统
echo.
choice /c 12 /n /m "请选择【1-2】："

echo %errorlevel%
if %errorlevel% == 1 goto install
if %errorlevel% == 2 goto uninstall



::卸载右键
:uninstall
cls

uwfmgr filter disable

echo.
echo.
echo. 关闭成功，重启生效。
ping localhost -n 2 1>nul 2>nul
exit



::安装右键
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
echo. 开启成功，重启生效。
ping localhost -n 2 1>nul 2>nul
exit




