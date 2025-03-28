@echo off
setlocal

:: Verifica che CMake sia nel PATH
where cmake >nul 2>nul
if %errorlevel% neq 0 (
    echo CMake non e' nel tuo PATH. Per favore installa CMake e aggiungilo al PATH.
    pause
    exit /b 1
)

:: Crea la cartella di build
mkdir ..\Build 2>nul
cd ..\Build

:: Scegli il generatore (modifica se necessario)
set GENERATOR="Visual Studio 17 2022"

:: Esegui CMake
cmake .. -G %GENERATOR%

if %errorlevel% neq 0 (
    echo Configurazione CMake fallita!
    pause
    exit /b 1
)

echo Configurazione completata con successo!
echo Puoi ora aprire il file .sln in ..\Build
pause