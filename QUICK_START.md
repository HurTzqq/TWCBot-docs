# 快速開始指南

## 🚀 3 步驟完成部署

### 步驟 1：在 GitHub 建立新倉庫

1. 前往 https://github.com/new
2. 填寫：
   - **Repository name**: `TWCBot-docs`
   - **Description**: `魔物獵人 Discord Bot 使用指南`
   - **Visibility**: 選擇 **Public** ⚠️（必須是 Public 才能免費使用 GitHub Pages）
   - **不要**勾選任何初始化選項
3. 點擊 "Create repository"
4. **複製倉庫 URL**：`https://github.com/hurtzqq/TWCBot-docs.git`

---

### 步驟 2：執行部署腳本

**方法一：使用批次檔（最簡單）**

1. 進入 `docs-repo` 資料夾
2. 雙擊 `deploy.bat`
3. 當提示設定遠端倉庫時，執行：
   ```bash
   git remote add origin https://github.com/hurtzqq/TWCBot-docs.git
   ```
4. 繼續執行腳本

**方法二：手動執行命令**

開啟命令提示字元，在 `docs-repo` 資料夾中執行：

```bash
# 1. 初始化 Git
git init

# 2. 設定遠端倉庫（替換為您的實際 URL）
git remote add origin https://github.com/hurtzqq/TWCBot-docs.git

# 3. 設定 Git 用戶身份（如果還沒有）
git config --global user.name "hurtzqq"
git config --global user.email "hurtzqq@users.noreply.github.com"

# 4. 添加檔案
git add .

# 5. 提交
git commit -m "Initial commit: Documentation"

# 6. 推送到 GitHub
git branch -M main
git push -u origin main

# 7. 部署到 GitHub Pages
python -m mkdocs gh-deploy
```

**注意**：推送時會要求輸入認證：
- Username: `hurtzqq`
- Password: 使用 Personal Access Token（不是 GitHub 密碼）

---

### 步驟 3：啟用 GitHub Pages

1. 前往 https://github.com/hurtzqq/TWCBot-docs/settings/pages
2. 在 "Source" 部分：
   - 選擇分支：`gh-pages`
   - 選擇資料夾：`/ (root)`
3. 點擊 "Save"
4. 等待 1-5 分鐘

---

## 🌐 訪問網站

部署完成後，網站網址為：

```
https://hurtzqq.github.io/TWCBot-docs/
```

---

## 🔑 如果還沒有 Personal Access Token

1. 前往 https://github.com/settings/tokens
2. 點擊 "Generate new token (classic)"
3. 填寫：
   - **Note**: `TWCBot-docs Deployment`
   - **Expiration**: 選擇過期時間
   - **Scopes**: 勾選 `repo`
4. 點擊 "Generate token"
5. **複製 Token**（只會顯示一次）

---

## ✅ 完成檢查清單

- [ ] 已在 GitHub 建立 `TWCBot-docs` 倉庫（Public）
- [ ] 已執行 `git remote add origin`
- [ ] 已推送檔案到 GitHub
- [ ] 已執行 `python -m mkdocs gh-deploy`
- [ ] 已在 GitHub Pages 設定中選擇 `gh-pages` 分支
- [ ] 網站可以正常訪問

---

## 🔄 之後更新文檔

當您修改文檔後，只需：

1. 在 `docs-repo/docs/` 中修改檔案
2. 執行 `deploy.bat` 或手動執行：
   ```bash
   git add .
   git commit -m "Update documentation"
   git push
   python -m mkdocs gh-deploy
   ```

---

## ❓ 遇到問題？

### 問題 1：推送失敗

**解決方案**：
- 確認使用 Personal Access Token 而不是密碼
- 確認 Token 有 `repo` 權限

### 問題 2：部署失敗

**解決方案**：
- 確認已安裝 MkDocs：`pip install mkdocs mkdocs-material mkdocs-minify-plugin`
- 確認在 `docs-repo` 資料夾中執行

### 問題 3：網站顯示 404

**解決方案**：
- 確認已啟用 GitHub Pages
- 確認選擇了 `gh-pages` 分支
- 等待幾分鐘後再試

---

祝您部署順利！🎉

