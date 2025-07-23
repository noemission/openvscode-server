#! /bin/bash

npm version patch
TAG=$(git describe --tags --abbrev=0)
git push --follow-tags
echo "Releasing $TAG"
gh release create $TAG -n "Release notes for $TAG" -t "Release $TAG" final-binaries/*.tar.gz
