@echo off
setlocal
cd /d "%~dp0"
call npm ci
if errorlevel 1 goto failed
call npm run build
if errorlevel 1 goto failed
echo Setup complete. Use RUN_DASHBOARD.bat.
pause
exit /b 0
:failed
echo Setup failed. See errors above.
pause
exit /b 1
