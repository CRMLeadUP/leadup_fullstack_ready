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
cp dist/index.html ../templates/index.html

echo "✅ Build do frontend finalizado"
