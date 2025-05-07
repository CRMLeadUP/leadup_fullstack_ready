#!/bin/bash
echo "🔧 Instalando dependências do frontend..."
cd frontend
npm install

echo "🏗️  Gerando build do Vite..."
npm run build

echo "📦 Movendo arquivos do build para templates/static do Flask..."
mkdir -p ../templates
mkdir -p ../static/assets

cp -r dist/assets/* ../static/assets/
JS_FILE=$(ls dist/assets/*.js | grep -v ".map" | head -n 1 | xargs -n 1 basename)
CSS_FILE=$(ls dist/assets/*.css | grep -v ".map" | head -n 1 | xargs -n 1 basename)

sed -e "s|__CSS__|$CSS_FILE|" -e "s|__JS__|$JS_FILE|" dist/index.html > ../templates/index.html

echo "✅ Build do frontend finalizado"
