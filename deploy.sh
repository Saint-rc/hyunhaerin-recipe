#!/bin/bash
# 내맘대로레시피 배포 스크립트
# 사용법: ./deploy.sh "커밋 메시지"

MSG=${1:-"feat: 레시피 업데이트"}
REMC="/Users/danial/Desktop/AI/REMC"
RECIPE="/Users/danial/Desktop/AI/hyunhaerin-recipe"

echo "📋 index.html 동기화 중..."
cp "$REMC/shared data/index.html" "$RECIPE/index.html"

echo "🖼️ 이미지 동기화 중..."
rsync -a --delete "$REMC/shared data/images/toddler/" "$RECIPE/images/toddler/"

echo "🚀 배포 저장소 push 중..."
cd "$RECIPE"
git add .
git commit -m "$MSG"
git push origin main

echo "✅ 배포 완료! https://saint-rc.github.io/hyunhaerin-recipe/"
