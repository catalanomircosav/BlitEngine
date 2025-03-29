@echo off
setlocal

:: Check that we're in the correct folder
if not exist "..\CMakeLists.txt" (
    echo Error: Run this script from the Scripts folder
    pause
    exit /b 1
)

:: Check that the Build folder exists
if not exist "..\Build" (
    echo Error: First run setup.bat to configure the project
    pause
    exit /b 1
)

:: Go to the Build folder
cd ..\Build

echo Compiling...

:: Choose the build type (modify if needed)
set BUILD_CONFIG=Debug

:: Run the compilation
cmake --build . --config %BUILD_CONFIG% -- /m /nologo /v:minimal

if %errorlevel% neq 0 (
    echo Compilation failed!
    pause
    exit /b 1
)

echo Compilation completed successfully!
echo The executables are in ..\Build\bin\%BUILD_CONFIG%\

:: Copy assets to the output folder (if needed)
if not exist "bin\%BUILD_CONFIG%\Assets" mkdir "bin\%BUILD_CONFIG%\Assets"
xcopy /Y /Q "..\Game\Assets\*" "bin\%BUILD_CONFIG%\Assets\"

pause