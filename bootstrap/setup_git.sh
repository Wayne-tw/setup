#!/bin/sh

set -e

cd "$(dirname "$0")/"

cp git/gitconfig ~/.gitconfig
cp -r git/git-template ~/.git-template

echo ""
echo ""
cat ~/.gitconfig
echo "Git Config and Git Template set"
echo ""
echo ""