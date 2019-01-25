@echo off
cd /d "%~dp0"
md "result\" 2>nul
for %%a in ("%cd%") do set "fd=%%~nxa"
for /f "delims=" %%a in ('dir /a-d/b *.csv') do (
    (for /f "delims=" %%b in ('type "%%a"') do (
        echo;%%~na,%%b
    ))>"result\%%a"
)
copy result\*.csv All.csv 1>nul
rd /S /Q result\
pause