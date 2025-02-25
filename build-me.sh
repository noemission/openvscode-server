#! /bin/bash
# Run it as follows ./build-me.sh linux arm64
# Run it as follows ./build-me.sh darwin arm64

rm -rf node_modules/
rm -rf extensions/node_modules/
rm -rf out*
npm i
npm run compile-build
yarn gulp minify-vscode-reh-web
yarn gulp vscode-reh-web-$1-$2-min-ci

mkdir ../output
mv ../vscode-reh-* ../output
