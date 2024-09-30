#!/bin/sh

set -e

cd "$(dirname "$0")/"

nodenv --version

NODENV_VERSION=20.5.0


if [ "$(nodenv global)" = $NODENV_VERSION ]; then
  echo 🎉🎉🎉 Node $NODENV_VERSION already installed 🎉🎉🎉
else
    nodenv install $NODENV_VERSION && nodenv global $NODENV_VERSION
fi

echo "Installing NX"
npm install -g nx

echo ""
echo ""
echo 🎉🎉🎉YAAAAS! Lets get coding 🎉🎉🎉
echo ""
echo ""