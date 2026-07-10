#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

echo "🔨 Building..."
"$DIR/node_modules/.bin/hexo" clean
"$DIR/node_modules/.bin/hexo" generate

echo "📦 Deploying to gh-pages..."
TEMP=$(mktemp -d)
cp -r public/* "$TEMP/"
touch "$TEMP/.nojekyll"

rm -rf /tmp/gh-pages-deploy
git worktree add /tmp/gh-pages-deploy origin/gh-pages 2>/dev/null || true
cd /tmp/gh-pages-deploy
find . -not -path './.git/*' -not -name '.git' -delete
cp -r "$TEMP"/* .
touch .nojekyll
git add -A
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M')" || true
git push origin HEAD:gh-pages

cd "$DIR"
rm -rf /tmp/gh-pages-deploy "$TEMP"
echo "✅ Done — https://dongqinggu.github.io"
