@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
 echo Node.js is missing. Install Node.js 22 LTS, then reopen this launcher.
 pause
 exit /b 1
)
if not exist "dist\index.html" (
 echo Build missing. Run npm.cmd ci then npm.cmd run build once in this folder.
 pause
 exit /b 1
)
if exist "FOREST_PROVIDER.local.bat" call "FOREST_PROVIDER.local.bat"
set V2X_OPEN_BROWSER=1
echo Keep this window open while using the dashboard. Press Ctrl+C to stop.
node scripts\serve.mjs
if errorlevel 1 echo Server stopped with an error. Read the message above.
pause
