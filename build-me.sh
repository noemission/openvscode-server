#! /bin/bash
# Run it as follows ./build-me.sh linux arm64
# Run it as follows ./build-me.sh darwin arm64
# Run it as follows ./build-me.sh linux x64

rm -rf node_modules/ && rm -rf extensions/node_modules/ && rm -rf out*
npm i
npm run compile && npm run compile-build && yarn gulp minify-vscode-reh-web && yarn gulp vscode-reh-web-$1-$2-min-ci

file node_modules/@vscode/spdlog/build/Release/spdlog.node
file node_modules/node-pty/build/Release/pty.node
file node_modules/@parcel/watcher/build/Release/watcher.node
file node_modules/native-watchdog/build/Release/watchdog.node

file ../vscode-reh-web-$1-$2/node_modules/\@vscode/spdlog/build/Release/spdlog.node
file ../vscode-reh-web-$1-$2/node_modules/node-pty/build/Release/pty.node
file ../vscode-reh-web-$1-$2/node_modules/\@parcel/watcher/build/Release/watcher.node
file ../vscode-reh-web-$1-$2/node_modules/native-watchdog/build/Release/watchdog.node

cp node_modules/\@vscode/spdlog/build/Release/spdlog.node ../vscode-reh-web-$1-$2/node_modules/\@vscode/spdlog/build/Release/spdlog.node
cp node_modules/node-pty/build/Release/pty.node ../vscode-reh-web-$1-$2/node_modules/node-pty/build/Release/pty.node
cp node_modules/\@parcel/watcher/build/Release/watcher.node ../vscode-reh-web-$1-$2/node_modules/\@parcel/watcher/build/Release/watcher.node
cp node_modules/native-watchdog/build/Release/watchdog.node ../vscode-reh-web-$1-$2/node_modules/native-watchdog/build/Release/watchdog.node

mkdir ../output
tar czf ../output/vscode-reh-web-$1-$2.tar.gz ../vscode-reh-web-$1-$2/
