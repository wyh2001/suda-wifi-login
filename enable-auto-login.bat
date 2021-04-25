@echo off

echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    cls
    goto main
) else (
    echo Failure: Current permissions inadequate.
    pause
    exit
)

:main
echo suda-wifi-login
echo by @wyh2001
echo By adding a task to Windows Task Scheduler, this batch file helps you automate suda-wifi-login's process
pause
cls
echo 1.enable
echo 2.disable
echo 3.exit
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
:op1
cp login.py login.bat config.json %ProgramFiles%\suda-wifi-login
schtasks.exe /Create /XML auto-login.xml /tn suda-wifi-login
:op2
schtasks.exe /delete suda-wifi-login
rd %ProgramFiles%\suda-wifi-login
:op3
exit
