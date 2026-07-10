#!/bin/bash
set -e

cd "$(dirname "$0")"

echo "🔨 Building..."
npx hexo clean > /dev/null 2>&1
npx hexo generate > /dev/null 2>&1

echo "📦 Deploying to gh-pages..."
TEMP=$(mktemp -d)
cp -r public/* "$TEMP/"
touch "$TEMP/.nojekyll"

git fetch origin gh-pages -q
git -C "$TEMP" init -q
git -C "$TEMP" checkout -b gh-pages
git -C "$TEMP" add -A
git -C "$TEMP" commit -m "Deploy: $(date '+%Y-%m-%d %H:%M')" || true
git -C "$TEMP" push -f origin gh-pages

rm -rf "$TEMP"
echo "✅ Done — https://dongqinggu.github.io"
