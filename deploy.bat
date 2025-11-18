@echo off
chcp 65001 >nul
echo ========================================
echo   GitHub Pages 部署腳本
echo   文檔倉庫部署
echo ========================================
echo.

REM 檢查 Git 是否安裝
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [錯誤] 未檢測到 Git！
    echo.
    echo 請先安裝 Git：
    echo 1. 前往 https://git-scm.com/download/win
    echo 2. 下載並安裝 Git for Windows
    echo 3. 安裝完成後重新執行此腳本
    echo.
    pause
    exit /b 1
)

echo [✓] Git 已安裝
echo.

REM 檢查是否已初始化 Git
if not exist .git (
    echo [1/5] 初始化 Git 倉庫...
    git init
    echo [✓] Git 倉庫已初始化
) else (
    echo [1/5] Git 倉庫已存在
)
echo.

REM 檢查是否已設定遠端倉庫
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo [2/5] 尚未設定遠端倉庫
    echo.
    echo 請先執行：
    echo   git remote add origin https://github.com/hurtzqq/TWCBot-docs.git
    echo.
    set /p CONTINUE="是否已設定遠端倉庫？(Y/N): "
    if /i not "%CONTINUE%"=="Y" (
        echo 部署已取消。
        pause
        exit /b 1
    )
) else (
    echo [2/5] 遠端倉庫已設定
)
echo.

echo [3/5] 檢查 Git 用戶身份...
git config user.name >nul 2>&1
if %errorlevel% neq 0 (
    echo [資訊] 設定 Git 用戶身份...
    git config --global user.name "hurtzqq"
    git config --global user.email "hurtzqq@users.noreply.github.com"
    echo [✓] Git 用戶身份已設定
) else (
    echo [✓] Git 用戶身份已設定
)
echo.

echo [4/5] 添加並提交檔案...
git add .
git commit -m "Update documentation" >nul 2>&1
if %errorlevel% neq 0 (
    git commit -m "Initial commit: Documentation"
    echo [✓] 已提交變更
) else (
    echo [✓] 已提交變更
)
echo.

echo [5/5] 推送到 GitHub...
git branch -M main 2>nul
git push -u origin main 2>nul
if %errorlevel% neq 0 (
    echo [警告] 推送失敗
    echo.
    echo 請手動執行：git push -u origin main
    echo.
    pause
    exit /b 1
)
echo [✓] 已推送到 GitHub
echo.

echo [6/6] 部署到 GitHub Pages...
python -m mkdocs gh-deploy
if %errorlevel% neq 0 (
    echo [錯誤] 部署失敗！
    echo.
    echo 可能的原因：
    echo 1. 尚未安裝 MkDocs：pip install mkdocs mkdocs-material mkdocs-minify-plugin
    echo 2. 尚未在 GitHub 上啟用 Pages
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   部署完成！
echo ========================================
echo.
echo 您的網站應該會在幾分鐘內上線：
echo https://hurtzqq.github.io/TWCBot-docs/
echo.
echo 如果尚未啟用 GitHub Pages，請：
echo   1. 前往 https://github.com/hurtzqq/TWCBot-docs/settings/pages
echo   2. 選擇 gh-pages 分支
echo   3. 選擇 / (root) 資料夾
echo   4. 點擊 Save
echo.
pause

