@echo off
chcp 65001 >nul
echo ========================================
echo    Git Push to GitHub - MicroFlight
echo ========================================
echo.

cd /d "%~dp0"

REM Check if git repo exists
if not exist ".git" (
    echo [Error] Not a git repository
    pause
    exit /b 1
)

echo Current: %cd%
echo.

echo ===== Git Status =====
git status
echo.

echo ===== Git Add =====
git add -A
echo.

echo ===== Git Diff Stats =====
git diff --cached --stat
echo.

echo Please enter commit message:
echo (Press Enter for default: Update)
set /p msg=
if "%msg%"=="" set msg=Update

echo.
echo ===== Git Commit =====
git commit -m "%msg%"
echo.

echo ===== Git Pull (Rebase) =====
git pull origin main --rebase
echo.

echo ===== Git Push =====
git push -u origin main

echo.
echo Done!
echo GitHub: https://github.com/Airplaneload/video-maker
echo.
pause
