@echo off
setlocal

:: Verifica che siamo nella cartella corretta
if not exist "..\CMakeLists.txt" (
    echo Errore: Esegui questo script dalla cartella Scripts
    pause
    exit /b 1
)

:: Verifica che la cartella Build esista
if not exist "..\Build" (
    echo Errore: Prima esegui setup.bat per configurare il progetto
    pause
    exit /b 1
)

:: Vai alla cartella Build
cd ..\Build

echo Compilazione in corso...

:: Scegli il tipo di build (modifica se necessario)
set BUILD_CONFIG=Debug

:: Esegui la compilazione
cmake --build . --config %BUILD_CONFIG% -- /m /nologo /v:minimal

if %errorlevel% neq 0 (
    echo Compilazione fallita!
    pause
    exit /b 1
)

echo Compilazione completata con successo!
echo Gli eseguibili sono in ..\Build\bin\%BUILD_CONFIG%\

:: Copia gli asset nella cartella di output (se necessario)
if not exist "bin\%BUILD_CONFIG%\Assets" mkdir "bin\%BUILD_CONFIG%\Assets"
xcopy /Y /Q "..\Game\Assets\*" "bin\%BUILD_CONFIG%\Assets\"

pause