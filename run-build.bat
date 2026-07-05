@echo off
cd /d "%~dp0brainstorming"
title Brainstorming - Build de Producao
echo ===================================
echo   Gerando build do Brainstorming
echo ===================================
echo.

call npm run tauri build

echo.
echo ===================================
echo   Build concluido!
echo   Instalador em: src-tauri\target\release\bundle
echo ===================================
echo.

pause