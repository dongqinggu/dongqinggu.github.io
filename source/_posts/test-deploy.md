---
title: 测试自动部署
date: 2026-07-10 23:03:58
tags:
  - 测试
categories: 随笔
description: 这是一篇测试文章，验证 GitHub Actions 自动部署是否正常工作。
toc: true
---

## 测试目的

这篇文章用于验证：

1. `git push` 到 `main` 分支后
2. GitHub Actions 自动触发构建
3. 生成的静态页面正确部署

## 如果看到这里

说明自动部署已经**完美运行** 🎉

```bash
# 日常发布流程
npx hexo new post "文章标题"
# 编辑 source/_posts/文章标题.md
git add . && git commit -m "new post" && git push
# → 等待 1-2 分钟，刷新网站即可看到更新
```

> 大道至简，回归写作的本质。
