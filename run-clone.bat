@echo off
cd /d "%~dp0brainstorming"
title Brainstorming - Primeira Execucao
echo ============================================
echo   Configurando o Brainstorming (primeira vez)
echo ============================================
echo.

REM --- Verifica se o Node.js esta instalado ---
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRO] Node.js nao encontrado.
    echo Instale em: https://nodejs.org e rode este script novamente.
    pause
    exit /b 1
)
echo [OK] Node.js encontrado.

REM --- Verifica se o Rust/Cargo esta instalado ---
where cargo >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRO] Rust/Cargo nao encontrado.
    echo Instale em: https://rustup.rs e rode este script novamente.
    pause
    exit /b 1
)
echo [OK] Rust encontrado.
echo.

echo Atualizando o Rust para evitar erros de build...
call rustup update
echo.

echo Instalando dependencias do Node...
call npm install
if %errorlevel% neq 0 (
    echo [ERRO] Falha no npm install.
    pause
    exit /b 1
)
echo.

echo Instalando pacotes adicionais do projeto...
call npm install @tauri-apps/api @tauri-apps/plugin-dialog lucide-react
echo.

echo Instalando dependencia Rust do dialogo (plugin-dialog)...
call cargo add tauri-plugin-dialog --manifest-path src-tauri/Cargo.toml
echo.

echo ============================================
echo   Tudo pronto! Iniciando o app...
echo ============================================
echo.

call npm run tauri dev

pause