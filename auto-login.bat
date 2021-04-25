@echo off

echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    cls
    goto start
) else (
    echo Failure: Current permissions inadequate.
    pause
    exit
)

:start
cd /D %~dp0
echo suda-wifi-login
echo Thanking to Windows Task Scheduler, it helps you automatically log into SUDA_WIFI
pause
goto main
:main
cls
echo 1.Enable
echo 2.Disable
echo 3.Exit
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
:op1
md "%ProgramFiles%\suda-wifi-login"
copy .\*.* "%ProgramFiles%\suda-wifi-login"
schtasks.exe /Create /XML auto-login.xml /tn suda-wifi-login
pause
cls
goto main
:op2
schtasks.exe /delete /tn "suda-wifi-login" /F
rmdir "%ProgramFiles%\suda-wifi-login" /S /Q
pause
cls
goto main
:op3
exit
