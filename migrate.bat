@echo off
setlocal enabledelayedexpansion

:: 设置标题和颜色
title Librewolf 到 Vantage 数据迁移工具
color 3f

:CHECK_PROCESS
cls
:: 定义源路径和目标路径
set "SOURCE=%appdata%\librewolf"
set "DEST=%appdata%\vantage"
set "PROCESS_NAME=Vantage.exe"

echo ==================================================
echo          Vantage数据迁移
echo ==================================================
echo.

:: 检查 Vantage 进程是否存在
echo [检查] 正在检测 Vantage 浏览器是否正在运行...
tasklist /FI "IMAGENAME eq %PROCESS_NAME%" 2>NUL | find /I /N "%PROCESS_NAME%">NUL

if "%ERRORLEVEL%"=="0" (
    echo.
    echo [警告] 检测到 Vantage 正在运行！
    echo        为了防止数据损坏，请务必先关闭 Vantage 浏览器。
    echo.
    pause
    echo.
    echo [重试] 重新检测中...
    goto :CHECK_PROCESS
) else (
    echo [成功] Vantage 未运行，可以继续。
)

echo.
echo --------------------------------------------------
echo 即将开始搬运数据：
echo   从: %SOURCE%
echo   到: %DEST%
echo --------------------------------------------------
echo.
echo 请按任意键开始复制文件 (这可能需要几分钟)...
pause >nul

:: 确保目标文件夹存在
if not exist "%DEST%" (
    echo [操作] 正在创建目标文件夹...
    mkdir "%DEST%"
)

:: 1. 复制阶段 (使用 xcopy 保持目录结构并覆盖文件)
echo.
echo [步骤 1/2] 正在复制所有文件...
:: /E 复制目录和子目录，包括空的
:: /Y 覆盖现有文件而不提示
:: /I 如果目标不存在且复制多个文件，则假定目标是目录
xcopy "%SOURCE%\*" "%DEST%\" /E /Y /I /Q

if "%ERRORLEVEL%"=="0" (
    echo [成功] 文件复制完成。
) else (
    echo [错误] 文件复制过程中出现错误。
    pause
    exit /b 1
)

:: 2. 删除阶段
echo.
echo [步骤 2/2] 正在删除原始文件...
:: /Q 安静模式
:: /S 删除指定目录中的所有子目录
:: /R 删除只读文件
del /Q /S "%SOURCE%\*"

:: 尝试删除源目录本身（可选，如果希望彻底移除 librewolf 文件夹）
rmdir "%SOURCE%" 2>NUL

if "%ERRORLEVEL%"=="0" (
    echo [成功] 原始数据已清理。
) else (
    echo [注意] 文件已删除，但可能残留空文件夹 (请手动检查)。
)

echo.
echo ==================================================
echo           搬运完成！
echo ==================================================
echo 您的数据已成功从 Librewolf 迁移到 Vantage。
echo 现在可以安全地打开 Vantage 浏览器了。
echo.
pause