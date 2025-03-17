#!/bin/sh

set -e

cd "$(dirname "$0")/"

nodenv --version >/dev/null 2>&1

NODENV_VERSION=20.5.0


if [ "$(nodenv global)" != $NODENV_VERSION ]; then
   nodenv install $NODENV_VERSION && nodenv global $NODENV_VERSION
fi

nx --version >/dev/null 2>&1 || (echo "Installing NX" && npm install -g nx)

echo 🎉🎉🎉 Node ${NODENV_VERSION} setup 🎉🎉🎉