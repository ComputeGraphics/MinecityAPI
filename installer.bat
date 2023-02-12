@echo off
cd %localappdata%\Temp\qwix.minecity
title Minecity Installer
mode con:cols=178 lines=50
chcp 65001 >nul
SETLOCAL ENABLEDELAYEDEXPANSION
:start-saver
echo ########            ########    ####    ########             ####    ####################      ####################    ####    ############################    ####          ####
echo #### ####          #### ####    ####    #### ####            ####    ####################      ####################    ####    ############################     ####        ####
echo ####  ####        ####  ####    ####    ####  ####           ####    ####################     ####                     ####                ####                  ####      ####
echo ####   ####      ####   ####    ####    ####   ####          ####    ####                    ####                      ####                ####                   ####    ####
echo ####    ####    ####    ####    ####    ####    ####         ####    ####                    ####                      ####                ####                    ####  ####
echo ####     ####  ####     ####    ####    ####     ####        ####    ####################    ####                      ####                ####                     ########
echo ####      ########      ####    ####    ####      ####       ####    ####################    ####                      ####                ####                       ####
echo ####                    ####    ####    ####       ####      ####    ####################    ####                      ####                ####                       ####
echo ####                    ####    ####    ####        ####     ####    ####                    ####                      ####                ####                       ####
echo ####                    ####    ####    ####         ####    ####    ####                    ####                      ####                ####                       ####
echo ####                    ####    ####    ####          ####   ####    ####                    ####                      ####                ####                       ####
echo ####                    ####    ####    ####           ####  ####    ####################     ####                     ####                ####                       ####
echo ####                    ####    ####    ####            #### ####    ####################      ####################    ####                ####                       ####
echo ####                    ####    ####    ####             ########    ####################      ####################    ####                ####                       ####


:update-setup
echo Starting
echo [          ]
ping github.com >nul
if %ERRORLEVEL% == 1 (echo ERROR: Could not reach Update Server. Check Firewall, Blacklist or Connection? & goto :eof) else (echo Connection Established)
mkdir %localappdata%\Temp\qwix.minecity >nul

del "%localappdata%\Temp\qwix.minecity\detect_start.mci" /F /S /Q
del "%localappdata%\Temp\qwix.minecity\detect_dload.mci" /F /S /Q
del "%localappdata%\Temp\qwix.minecity\detect_ext.mci" /F /S /Q
del "%localappdata%\Temp\qwix.minecity\detect_inst.mci" /F /S /Q
del "%localappdata%\Temp\qwix.minecity\detect_fin.mci" /F /S /Q

timeout /t 2 >nul
echo qwix.startapp.register.minecity_installer.fin_start>>"%localappdata%\Temp\qwix.minecity\detect_start.mci"
cls

echo Downloading
echo [▓▓        ]
bitsadmin /transfer MinecityAPI /download /priority normal https://github.com/ComputeGraphics/MinecityAPI/raw/updates/MinecityAPI.zip "%localappdata%\Temp\qwix.minecity\minecity_api.zip"
timeout /t 3 >nul
echo qwix.startapp.register.minecity_installer.fin_dload>>"%localappdata%\Temp\qwix.minecity\detect_dload.mci"
cls

echo Extracting
echo [▓▓▓▓      ]
tar -xf "%localappdata%\Temp\qwix.minecity\minecity_api.zip"
timeout /t 2 >nul
echo qwix.startapp.register.minecity_installer.fin_ext>>"%localappdata%\Temp\qwix.minecity\detect_ext.mci"
cls

echo Installing
echo [▓▓▓▓▓▓    ]

xcopy "%localappdata%\Temp\qwix.minecity\Minecity API\" "%localappdata%\Minecity\app\" /E /Q /H /R /Y

timeout /t 1 >nul
cls

echo Installing
echo [▓▓▓▓▓▓▓▓  ]

IF NOT EXIST "%localappdata%\Minecity" (mkdir "%localappdata%\Minecity")
IF NOT EXIST "%localappdata%\Minecity\caches" (mkdir "%localappdata%\Minecity\caches")
IF NOT EXIST "%localappdata%\Minecity\projects" (mkdir "%localappdata%\Minecity\projects")
IF NOT EXIST "%localappdata%\Minecity\updates" (mkdir "%localappdata%\Minecity\updates")
IF NOT EXIST "%localappdata%\Minecity\backup" (mkdir "%localappdata%\Minecity\backup")
IF NOT EXIST "%localappdata%\Minecity\app" (mkdir "%localappdata%\Minecity\app")

timeout /t 2 >nul
echo qwix.startapp.register.minecity_installer.fin_inst>>"%localappdata%\Temp\qwix.minecity\detect_inst.mci"
cls

echo Verifying
echo [▓▓▓▓▓▓▓▓▓▓]
timeout /t 3 >nul
echo qwix.startapp.register.minecity_installer.fin>>"%localappdata%\Temp\qwix.minecity\detect_fin.mci"
cls
del "%localappdata%\Temp\qwix.minecity\detect_start.mci" /F /S /Q
del "%localappdata%\Temp\qwix.minecity\detect_dload.mci" /F /S /Q
del "%localappdata%\Temp\qwix.minecity\detect_ext.mci" /F /S /Q
del "%localappdata%\Temp\qwix.minecity\detect_inst.mci" /F /S /Q
del "%localappdata%\Temp\qwix.minecity\detect_fin.mci" /F /S /Q
del .\updater.bat
exit