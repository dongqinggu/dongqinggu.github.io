#!/bin/bash
set -e

echo "🛠  Building Hexo site..."
cd "$(dirname "$0")"
npx hexo clean
npx hexo generate

echo "📦 Deploying to gh-pages..."
TEMP_DIR=$(mktemp -d)
cp -r public/* "$TEMP_DIR/"
cp public/.nojekyll "$TEMP_DIR/" 2>/dev/null || touch "$TEMP_DIR/.nojekyll"

git fetch origin gh-pages
git worktree add /tmp/gh-pages-deploy origin/gh-pages
cd /tmp/gh-pages-deploy
find . -not -path './.git/*' -not -name '.git' -delete
cp -r "$TEMP_DIR"/* .
touch .nojekyll
git add -A
git commit -m "Deploy: $(date +%Y-%m-%d-%H%M)" || echo "No changes"
git push origin HEAD:gh-pages

cd "$(dirname "$0")"
git worktree remove /tmp/gh-pages-deploy
rm -rf "$TEMP_DIR"

echo "✅ Deployed! Visit https://dongqinggu.github.io"
