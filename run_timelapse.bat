@echo off
chcp 65001 >nul
title TimeLapse@Desk - 每日拍照

echo ======================================
echo    TimeLapse@Desk 每日拍照程序
echo ======================================
echo.

REM 检查Python是否安装
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误：未检测到Python，请先安装Python
    pause
    exit /b 1
)

REM 激活conda的dev环境
echo 正在激活conda环境...
call conda activate dev
if %errorlevel% neq 0 (
    echo 错误：无法激活conda环境 'dev'
    echo 请确保已安装conda并创建了dev环境
    pause
    exit /b 1
)

REM 检查依赖包
pip show opencv-python >nul 2>&1
if %errorlevel% neq 0 (
    echo 正在安装依赖包...
    pip install -r requirements.txt
    if %errorlevel% neq 0 (
        echo 错误：安装依赖包失败
        pause
        exit /b 1
    )
)

REM 自动运行拍照对齐程序
echo 正在启动自动拍照对齐程序...
python timelapse_demo.py

REM 等待用户确认
echo.
echo 程序执行完毕！
pause