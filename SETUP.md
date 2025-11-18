# 文檔倉庫設定指南

## 📋 前置準備

### 1. 在 GitHub 上建立新倉庫

1. 前往 [GitHub](https://github.com)
2. 點擊右上角的 "+" > "New repository"
3. 填寫資訊：
   - **Repository name**: `TWCBot-docs`
   - **Description**: `魔物獵人 Discord Bot 使用指南`
   - **Visibility**: 選擇 **Public**（這樣才能免費使用 GitHub Pages）
   - **不要**勾選 "Initialize this repository with a README"
4. 點擊 "Create repository"
5. 複製倉庫 URL：`https://github.com/hurtzqq/TWCBot-docs.git`

---

## 🚀 部署步驟

### 步驟 1：進入文檔倉庫目錄

```bash
cd docs-repo
```

### 步驟 2：初始化 Git（如果還沒有）

```bash
git init
```

### 步驟 3：設定遠端倉庫

```bash
git remote add origin https://github.com/hurtzqq/TWCBot-docs.git
```

### 步驟 4：添加並提交檔案

```bash
git add .
git commit -m "Initial commit: Documentation"
```

### 步驟 5：推送到 GitHub

```bash
git branch -M main
git push -u origin main
```

當要求輸入認證時：
- Username: `hurtzqq`
- Password: 使用 Personal Access Token（不是 GitHub 密碼）

### 步驟 6：部署到 GitHub Pages

```bash
python -m mkdocs gh-deploy
```

---

## 🔑 Personal Access Token

如果還沒有 Token：

1. 前往 https://github.com/settings/tokens
2. 點擊 "Generate new token (classic)"
3. 勾選 `repo` 權限
4. 生成並複製 Token

---

## ⚙️ 啟用 GitHub Pages

1. 前往 https://github.com/hurtzqq/TWCBot-docs/settings/pages
2. 在 "Source" 部分：
   - 選擇分支：`gh-pages`
   - 選擇資料夾：`/ (root)`
3. 點擊 "Save"

---

## 🌐 訪問網站

部署完成後，網站網址為：

```
https://hurtzqq.github.io/TWCBot-docs/
```

---

## 🔄 更新文檔

當您修改文檔後：

1. 在 `docs-repo/docs/` 中修改檔案
2. 執行 `deploy.bat` 或手動執行：
   ```bash
   git add .
   git commit -m "Update documentation"
   git push
   python -m mkdocs gh-deploy
   ```

---

## ✅ 完成

現在您有：
- ✅ 主倉庫 `TWCBot`（Private，程式碼私密）
- ✅ 文檔倉庫 `TWCBot-docs`（Public，只包含文檔）
- ✅ 免費的 GitHub Pages 網站

---

## 📝 注意事項

- 此倉庫只包含文檔，不包含任何程式碼
- 主倉庫保持 Private，程式碼完全私密
- 文檔倉庫是 Public，但只包含使用指南

---

祝您部署順利！🎉

