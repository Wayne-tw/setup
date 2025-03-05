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

echo ""
echo ""
echo 🎉🎉🎉YAAAAS! Lets get coding 🎉🎉🎉
echo "Run the following command to add repo script and pairing script to your path."
echo "Then reset your terminal session to access the scripts"
echo ""
echo "echo 'export PATH=$(pwd)/../scripts:\$PATH' >> ~/.zshrc"
echo ""

