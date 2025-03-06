#!/bin/sh

set -e

cd "$(dirname "$0")/"

if [ -f "Brewfile" ] && [ "$(uname -s)" = "Darwin" ]; then
  echo ""
  echo ""
  echo 🕰 This might take some time 🕰
  echo 🫖 Make yourself a brew 🫖
  echo 😴 Put your feet up 🛀 
  echo ""
  echo ""
  brew update
  
  echo "==> Installing Homebrew dependencies…"
  brew config
  brew bundle check >/dev/null 2>&1 || brew bundle

  echo "==> Cleanup Homebrew dependencies…"
  brew cleanup
  
  echo ""
  echo ""
  echo 💿 You\'re all set 💿
fi

. ./setup_git.sh
. ./setup_node.sh
. ./setup_jenv.sh

existing_config="/Users/matthew/.zshrc"
if [ -f "$existing_config" ]; then
  date_suffix=$(date +%Y-%m-%d)
  existing_config_backup="${existing_config}.${date_suffix}"
  mv "$existing_config" "$existing_config_backup"
  echo "File '$existing_config' renamed to '$existing_config_backup'"
fi

touch ~/.variables
cp .zshrc ~/.zshrc
echo "Copied zshrc from .zshrc to ~/.zshrc"

echo ""
echo ""
echo 🎉🎉🎉YAAAAS! Lets get coding 🎉🎉🎉
echo "Run the following command to add repo script and pairing script to your path."
echo "Then reset your terminal session to access the scripts"
echo ""
echo "echo 'export PATH=$(pwd)/../scripts:\$PATH' >> ~/.zshrc"
echo ""

