@echo off
cd /d "%~dp0brainstorming"
title Brainstorming - Modo Desenvolvimento
echo ===================================
echo   Iniciando Brainstorming (dev)
echo ===================================
echo.

call npm run tauri dev

pause