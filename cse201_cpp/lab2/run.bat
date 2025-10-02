@echo off
REM Check if a file argument is provided
if "%~1"=="" (
    echo Usage: %~nx0 filename.c
    exit /b 1
)

REM Get the filename without extension
set "fname=%~n1"

REM Compile the C file
gcc -Wall -Werror -g "%~1" -o "%fname%.exe"
if errorlevel 1 (
    echo Compilation failed.
    exit /b 1
)

REM Run the executable
"%fname%.exe"