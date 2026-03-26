# 🚀 部署指南

## 方案一：Netlify 一键部署（推荐）

### 步骤1：推送到 GitHub

1. **创建 GitHub 仓库**
   - 访问：https://github.com/new
   - 仓库名：`chart-gallery-58`
   - 设为 Public
   - 点击 "Create repository"

2. **推送代码**
   ```bash
   cd C:\Users\admin\Desktop\skill\output\chart-gallery-58
   git branch -M main
   git remote add origin https://github.com/luzifeng/chart-gallery-58.git
   git push -u origin main
   ```

### 步骤2：部署到 Netlify

#### 方式A：通过 Netlify 网站（最简单）

1. 访问 https://app.netlify.com/
2. 点击 **"Add new site"** → **"Import an existing project"**
3. 选择 **"GitHub"**
4. 授权 Netlify 访问你的 GitHub
5. 选择仓库 `luzifeng/chart-gallery-58`
6. 构建设置：
   - **Build command**: 留空（静态站点无需构建）
   - **Publish directory**: `.` （根目录）
7. 点击 **"Deploy site"**

#### 方式B：通过 Netlify CLI

```bash
# 安装 Netlify CLI
npm install -g netlify-cli

# 登录
netlify login

# 部署
cd C:\Users\admin\Desktop\skill\output\chart-gallery-58
netlify deploy --prod
```

### 步骤3：自定义域名（可选）

在 Netlify 控制台：
1. Site settings → Domain management
2. Add custom domain
3. 按照提示配置 DNS

---

## 方案二：GitHub Pages 部署

### 步骤1：推送到 GitHub（同上）

### 步骤2：启用 GitHub Pages

1. 进入仓库：https://github.com/luzifeng/chart-gallery-58
2. 点击 **Settings** → **Pages**
3. **Source**: 选择 `main` 分支
4. **Folder**: 选择 `/ (root)`
5. 点击 **Save**

等待几分钟后，访问：
```
https://luzifeng.github.io/chart-gallery-58/gallery.html
```

---

## 方案三：Vercel 部署

1. 访问 https://vercel.com/
2. **Import Git Repository**
3. 选择 `luzifeng/chart-gallery-58`
4. 点击 **Deploy**

---

## 🎯 推荐配置

### 自定义 index.html

为了让访问根路径直接打开图库，创建 `index.html`：

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="refresh" content="0; url=./gallery.html">
  <title>图表库</title>
</head>
<body>
  <p>正在跳转到图表库...</p>
  <p>如果没有自动跳转，请点击: <a href="./gallery.html">进入图表库</a></p>
</body>
</html>
```

### 性能优化

1. **启用 CDN 缓存**（Netlify 自动启用）
2. **压缩资源**：
   ```bash
   # 可选：压缩 HTML
   npm install -g html-minifier-terser
   html-minifier-terser --input-dir . --output-dir dist --collapse-whitespace
   ```

---

## 📊 部署后验证

访问你的网站，检查：
- ✅ 首页加载正常
- ✅ 左侧导航显示所有图表
- ✅ 点击图表能正常预览
- ✅ 主题切换功能正常
- ✅ 搜索功能正常
- ✅ 移动端显示正常

---

## 🔧 故障排查

### 问题1：图表加载失败
- 检查浏览器控制台错误
- 确认 iframe 路径正确（相对路径）

### 问题2：主题切换无效
- 清除浏览器缓存
- 检查 JavaScript 控制台错误

### 问题3：404 错误
- 确认 `gallery.html` 在根目录
- 检查 netlify.toml 配置

---

## 📮 获取帮助

如有问题，请：
1. 查看 [Netlify 文档](https://docs.netlify.com/)
2. 提交 [GitHub Issue](https://github.com/luzifeng/chart-gallery-58/issues)

---

祝部署顺利！🎉
