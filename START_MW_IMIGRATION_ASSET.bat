@echo off
setlocal
title MW IMIGRATION ASSET v1.5.1 BETA
cd /d "%~dp0bridge"
if not exist "node_modules" (
  echo Installing bridge dependencies...
  call npm install --silent
  if errorlevel 1 (
    echo Failed to install dependencies.
    pause
    exit /b 1
  )
)
start "" "http://127.0.0.1:8787"
npm start
pause
