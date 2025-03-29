@echo off
setlocal

:: Check if CMake is in PATH
where cmake >nul 2>nul
if %errorlevel% neq 0 (
    echo CMake is not in your PATH. Please install CMake and add it to PATH.
    pause
    exit /b 1
)

:: Create build directory
mkdir ..\Build 2>nul
cd ..\Build

cmake ..

if %errorlevel% neq 0 (
    echo CMake configuration failed!
    pause
    exit /b 1
)

echo Configuration completed successfully!
echo You can now open the .sln file in ..\Build
pause