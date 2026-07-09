# Dongqing Gu · A4 Paper Blog

这是一个基于 Jekyll 和 GitHub Pages 的个人博客。页面采用 A4 纸张视觉：文章详情页会像一张居中的 A4 纸一样展示，适合发布诗词、札记、长文和可打印内容。

## 写文章

1. 在 `_posts/` 目录新增 Markdown 文件。
2. 文件名使用 `YYYY-MM-DD-slug.md`，例如 `2026-07-09-man-ting-fang.md`。
3. 文件顶部添加 Front Matter：

```yaml
---
title: 文章标题
date: 2026-07-09 00:00:00 +0000
categories: [分类]
tags: [标签一, 标签二]
---
```

4. 在 Front Matter 下方正常写 Markdown。
5. 提交并推送到 GitHub 后，GitHub Actions 会自动构建并发布到 `https://dongqinggu.github.io`。

## 本地预览

```bash
bundle install
bundle exec jekyll serve
```

然后打开 `http://127.0.0.1:4000`。

## 目录说明

- `_posts/`：博客文章。
- `_layouts/`：页面模板。
- `_includes/`：公共头部等片段。
- `assets/css/main.css`：A4 纸张主题样式。
- `.github/workflows/pages.yml`：自动构建并部署到 GitHub Pages 的工作流。
