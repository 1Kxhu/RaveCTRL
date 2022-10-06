@ECHO off
echo requesting admin
Reg.exe add HKLM /F >nul 2>&1
if %errorlevel% neq 0 start "" /wait /I /min powershell -NoProfile -Command start -verb runas "'%~s0'" && exit /b

::    Copyright (C) 2022 Kxhu, MP Inc.
::
::    This program is free software: you can redistribute it and/or modify
::    it under the terms of the GNU Affero General Public License as published
::    by the Free Software Foundation, either version 3 of the License, or
::    (at your option) any later version.
::
::    This program is distributed in the hope that it will be useful,
::    but WITHOUT ANY WARRANTY; without even the implied warranty of
::    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::    GNU Affero General Public License for more details.
::
::    You should have received a copy of the GNU Affero General Public License
::    along with this program.  If not, see <https://www.gnu.org/licenses/


chcp 65001

:: The Reg(s) needed for Ascii and col
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "COL=%%b")
Reg add HKCU\CONSOLE /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1

title  
cls
color 0
MODE 22,6
cls


MODE 85,12

cls
color 8
echo Loaded! If you want to quit, exit the program now.
echo.

goto warning

:warning
title RaveCTRL - Warning!
echo %COL%[35mWarning! %COL%[37m•----------------------  ---  --   --  -  -    -
echo %COL%[37mBefore continuing i want you to type in the code here: "%COL%[95m2353%COL%[37m"
echo I made this so you have to confirm that you actually wanted to run this file.
echo This program can cause problems, so think twice before choosing an option.
echo For support contact me on discord: %COL%[95mKxhu#4487%COL%[37m
echo.
set choice=
set /p choice=Code: %COL%[35m
if not '%choice%'=='' set choice=%choice%
if '%choice%'=='2353' goto start
cls
ECHO "%choice%" isn't the right code, please try again..
echo.
goto warning

:start

title RaveCTRL - Menu
cls
echo wait...
timeout 0 /t /nobreak
cls
echo fetching info
timeout 0 /t /nobreak
cls
echo wait..
timeout 0 /t /nobreak
cls
echo wait...
timeout 0 /t /nobreak
cls
echo fetching info
timeout 0 /t /nobreak
cls
echo wait..
timeout 0 /t /nobreak
cls
echo wait...
timeout 0 /t /nobreak
cls
echo fetching info
timeout 0 /t /nobreak
cls
echo wait..
timeout 0 /t /nobreak
cls

:: Change Window Size
MODE 22,6

MODE 75,19

cls
color 7

echo.
echo                 %COL%[95m▄▄▄   ▄▄▄·  ▌ ▐·▄▄▄ . ▄▄· ▄▄▄▄▄▄▄▄  ▄▄▌  
echo                 ▀▄ █·▐█ ▀█ ▪█·█▌▀▄.▀·▐█ ▌▪•██  ▀▄ █·██•  
echo                 ▐▀▀▄ ▄█▀▀█ ▐█▐█•%COL%[35m▐▀▀▪▄██ ▄▄ ▐█.▪▐▀▀▄ ██▪  
echo                 ▐█•█▌▐█ ▪▐▌ ███ ▐█▄▄▌▐███▌ ▐█▌·▐█•█▌▐█▌▐▌
echo                 .▀  ▀ ▀  ▀ . ▀   ▀▀▀ ·▀▀▀  ▀▀▀ .▀  ▀.▀▀▀ 
echo %col%[37m      -   -  -  -  -- --•%col%[90mInspired By %col%[37mHoneCTRL •--  --   -  -  -    -
echo.
echo %COL%[95m                                 WARN%COL%[35mING:
echo %COL%[37m             Please note that we cannot guarantee any Boost!
echo    Applying our optimizations, every system + configuration is different.
echo.

ECHO %COL%[35m[%COL%[37m1%COL%[35m] %COL%[37mRelease IpConfig                %COL%[35m[%COL%[37m5%COL%[35m] %COL%[37mReset Winsock
ECHO %COL%[35m[%COL%[37m2%COL%[35m] %COL%[37mRenew IpConfig                  %COL%[95m[%COL%[37m6%col%[95m] Next Page
ECHO %COL%[35m[%COL%[37m3%COL%[35m] %COL%[37mClear Temp, Prefetch            %COL%[35m[%COL%[37m7%COL%[35m] %COL%[37mEverything
ECHO %COL%[35m[%COL%[37m4%COL%[35m] %COL%[37mFlushDNS IpConfig               %COL%[35m[%COL%[37m8%COL%[35m] %COL%[37mQuit App
echo.
echo                                                                                                                                             %COL%[95m•%COL%[35mpage 1/2%COL%[37m
set choice=
set /p choice=Type in Your Choice: %COL%[35m
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto hello
if '%choice%'=='2' goto bye
if '%choice%'=='3' goto test
if '%choice%'=='4' goto test2
if '%choice%'=='5' goto test3

if '%choice%'=='6' goto fps
if '%choice%'=='7' goto everything


if '%choice%'=='8' goto end
echo.
ECHO "%choice%" doesn't exist, try again.
echo.
goto start


:hello
cls
color 9
ipconfig /release
goto start


:bye
cls
ipconfig /renew
goto start


:test
cls
color 9
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
goto start



:test2
cls
color 9
ipconfig /flushdns
goto start



:test3
cls
color 9
netsh winsock reset
goto start

:denied
echo %COL%[91maccess denied
goto start


:end
exit


:everything
cls
echo RaveCTRL is working, please Wait!
netsh winsock reset
cls
echo RaveCTRL is working, please Wait!
ipconfig /flushdns
cls
echo RaveCTRL is working, please Wait!
del /s /f /q c:\windows\temp\*.*
cls
echo RaveCTRL is working, please Wait!
rd /s /q c:\windows\temp
cls
echo RaveCTRL is working, please Wait!
md c:\windows\temp 
cls
echo RaveCTRL is working, please Wait!
del /s /f /q %temp%\*.*
cls
echo RaveCTRL is working, please Wait!
rd /s /q %temp%
cls
echo RaveCTRL is working, please Wait!
md %temp%
cls
echo RaveCTRL is working, please Wait!
ipconfig /release
cls
echo RaveCTRL is working, please Wait!
ipconfig /renew
cls
echo RaveCTRL is working, please Wait!

goto start

:fps
goto start2


:start2

cls
echo wait...
timeout 0 /t /nobreak
cls
echo fetching info
timeout 0 /t /nobreak
cls
echo wait..
timeout 0 /t /nobreak
cls
echo wait...
timeout 0 /t /nobreak
cls
echo fetching info
timeout 0 /t /nobreak
cls
echo wait..
timeout 0 /t /nobreak
cls
echo wait...
timeout 0 /t /nobreak
cls
echo fetching info
timeout 0 /t /nobreak
cls
echo wait..
timeout 0 /t /nobreak
cls
title RaveCTRL - Menu (page 2)

:: Change Window Size
MODE 22,6

MODE 75,19

cls
color 7

echo.
echo                 %COL%[95m▄▄▄   ▄▄▄·  ▌ ▐·▄▄▄ . ▄▄· ▄▄▄▄▄▄▄▄  ▄▄▌  
echo                 ▀▄ █·▐█ ▀█ ▪█·█▌▀▄.▀·▐█ ▌▪•██  ▀▄ █·██•  
echo                 ▐▀▀▄ ▄█▀▀█ ▐█▐█•%COL%[35m▐▀▀▪▄██ ▄▄ ▐█.▪▐▀▀▄ ██▪  
echo                 ▐█•█▌▐█ ▪▐▌ ███ ▐█▄▄▌▐███▌ ▐█▌·▐█•█▌▐█▌▐▌
echo                 .▀  ▀ ▀  ▀ . ▀   ▀▀▀ ·▀▀▀  ▀▀▀ .▀  ▀.▀▀▀ 
echo %col%[37m      -   -  -  -  -- --•%col%[90mInspired By %col%[37mHoneCTRL •--  --   -  -  -    -
echo.
echo %COL%[95m                                 WARN%COL%[35mING:
echo %COL%[37m             Please note that we cannot guarantee any Boost!
echo    Applying our optimizations, every system + configuration is different.
echo.

ECHO %COL%[35m[%COL%[37m1%COL%[35m] %COL%[37mCorrupt Files Scan              %COL%[35m[%COL%[37m5%COL%[35m] %COL%[37mPing localhost (check ping)
ECHO %COL%[35m[%COL%[37m2%COL%[35m] %COL%[37mReset Socket                    %COL%[95m[%COL%[37m6%col%[95m] First Page
ECHO %COL%[35m[%COL%[37m3%COL%[35m] %COL%[37mDisable XBOX Gamebar            %COL%[35m[%COL%[37m7%COL%[35m] %COL%[37mCredits
ECHO %COL%[35m[%COL%[37m4%COL%[35m] %COL%[37mDebloat Useless Apps            %COL%[35m[%COL%[37m8%COL%[35m] %COL%[37mQuit App
echo.
echo                                                                                                                                             %COL%[95m•%COL%[35mpage 2/2%COL%[37m
set choice=
set /p choice=Type in Your Choice: %COL%[35m
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto corruptfiles
if '%choice%'=='2' goto bye1
if '%choice%'=='3' goto test1
if '%choice%'=='4' goto test21
if '%choice%'=='5' goto test31

if '%choice%'=='6' goto fps1
if '%choice%'=='7' goto credits


if '%choice%'=='8' goto end
echo.
ECHO "%choice%" doesn't exist, try again.
echo.
goto start2

:test21

echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [                             0%                           ]
@powershell "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [==                           3.5%                         ]
@powershell "Get-AppxPackage *sway* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [====                         7.0%                         ]
@powershell "Get-AppxPackage *messaging* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=====                       10.5%                         ]
@powershell "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [======                      14.5%                         ]
@powershell "Get-AppxPackage *windowsalarms* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [========                    18.0%                         ]
@powershell "Get-AppxPackage *officehub* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [==========                  21.5%                         ]
@powershell "Get-AppxPackage *skypeapp* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [============                24.5%                         ]
@powershell "Get-AppxPackage *getstarted* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [==============              27.0%                         ]
@powershell "Get-AppxPackage *windowsmaps* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [==================          30.5%                         ]
@powershell "Get-AppxPackage *solitairecollection* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [====================        34.0%                         ]
@powershell "Get-AppxPackage *bingfinance* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [======================      37.5%                         ]
@powershell "Get-AppxPackage *zunevideo* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [========================    40.0%                         ]
@powershell "Get-AppxPackage *bingnews* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=========================  43.5%                          ]
@powershell "Get-AppxPackage *people* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=========================== 47.0%                         ]
@powershell "Get-AppxPackage *windowsphone* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================50.0%                         ]
@powershell "Get-AppxPackage *bingsports* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================53.5%==                       ]
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================56.7%====                     ]
@powershell "Get-AppxPackage *phone* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================59.5%======                   ]
@powershell "Get-AppxPackage *windowsdvdplayer* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================62.0%========                 ]
@powershell "Get-AppxPackage  *disney* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================65.5%==========               ]
@powerShell "Get-AppxPackage *ShazamEntertainmentLtd.Shazam* | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================69.0%============             ]
@powershell "Get-AppxPackage 'king.com.CandyCrushSaga' | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================75.0 %=============           ]
@powerShell "Get-AppxPackage 'king.com.CandyCrushSodaSaga' | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================79.5%%===============          ]
@powershell "Get-AppxPackage 'D5EA27B7.Duolingo-LearnLanguagesforFree' | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================85.0%%===================      ]
@powershell "Get-AppxPackage 'Microsoft.Advertising.Xaml' | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================90.5%%=====================    ]
@powershell "Get-AppxPackage 'Microsoft.Office.OneNote' | Remove-AppxPackage"
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================93.5%%=====================    ]
@powershell "Get-AppxPackage 'Microsoft.SkypeApp' | Remove-AppxPackage"
cls
echo Debloating useless packages (This may take some time. errors occur when package is already removed... ignore them)
echo [=============================100.0%%========================]
@powershell "Get-AppxPackage 'Microsoft.YourPhone' | Remove-AppxPackage"

goto start2

:fps1

goto start

:corruptfiles

cls
echo                 %COL%[95m▄▄▄   ▄▄▄·  ▌ ▐·▄▄▄ . ▄▄· ▄▄▄▄▄▄▄▄  ▄▄▌  
echo                 ▀▄ █·▐█ ▀█ ▪█·█▌▀▄.▀·▐█ ▌▪•██  ▀▄ █·██•  
echo                 ▐▀▀▄ ▄█▀▀█ ▐█▐█•%COL%[35m▐▀▀▪▄██ ▄▄ ▐█.▪▐▀▀▄ ██▪  
echo                 ▐█•█▌▐█ ▪▐▌ ███ ▐█▄▄▌▐███▌ ▐█▌·▐█•█▌▐█▌▐▌
echo                 .▀  ▀ ▀  ▀ . ▀   ▀▀▀ ·▀▀▀  ▀▀▀ .▀  ▀.▀▀▀ 
echo %COL%[35mthis might take a while....%COL%[37m
echo Windows/system32/cmd.exe ▪ performing a scan..
echo.

sfc /scannow

goto start2

:test31
echo %COL%[37m
cls
ping 127.0.0.1
echo %COL%[35mThis is your ping..%COL%[37m
pause
goto start2

:test1

reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_SZ /d "0" /f

goto start2

:credits
cls
echo %COL%[97mIf you want to ask a question add me on discord: Kxhu#4487
echo.
echo.
echo %COL%[97mJens A. Koch and Querty from %COL%[33mStackoverflow%COL%[97m for help with colors.
echo %COL%[37mhttps://stackoverflow.com/a/38617204/20025699
echo.
echo %COL%[97mAuraside (%COL%[33mHoneCTRL dev%COL%[97m) from %COL%[37mGithub%COL%[97m also for help with colors.
echo %COL%[37mhttps://github.com/auraside/HoneCtrl
echo.
echo.
echo %COL%[30m Made by Kxhu, Inspired by Hone.%COL%[97m
pause

goto start2