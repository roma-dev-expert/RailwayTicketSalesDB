@echo off

set ServerName=DESKTOP-MNRE0DU\SQLEXPRESS
set DatabaseName=RailwayTicketSales

sqlcmd -S %ServerName% -E -Q "CREATE DATABASE %DatabaseName%"

call :ExecuteSqlScripts Schema %ServerName% %DatabaseName%
call :ExecuteSqlScripts Data %ServerName% %DatabaseName%

:ExecuteSqlScripts
for /f %%i in (%~dp0%1\Order.txt) do (
    echo Running scripts in %1: %%i
    sqlcmd -S %2 -d %3 -E -i "%~dp0%1\%%i"
)
exit /b
