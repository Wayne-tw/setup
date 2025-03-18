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
  echo 🎉🎉🎉  Software up to date 🎉🎉🎉 
fi

if [ -d $HOME/.oh-my-zsh/ ]; then
  echo "🎉🎉🎉 oh-my-zsh already installed 🎉🎉🎉"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

. ./setup_git.sh || echo "Failed to setup git"
. ./setup_node.sh || echo "Failed to setup node"
# . ./setup_jenv.sh || echo "Failed to setup java"

if [ -L ~/.zshrc ]; then
  echo "🎉🎉🎉 Symlink from .zshrc to ~/.zshrc previously created 🎉🎉🎉"
else
  if [ -f ~/.zshrc ]; then
    date_suffix=$(date +%Y-%m-%d)
    existing_config_backup="~/.zshrc.${date_suffix}"
    mv ~/.zshrc "$existing_config_backup"
    echo "File ~/.zshrc' backed up to '$existing_config_backup'"
  fi
  ln -s $(pwd)/.zshrc $HOME/.zshrc && echo "🎉🎉🎉 Symlink created from .zshrc to ~/.zshrc 🎉🎉🎉"
  touch ~/.variables
fi

echo 🎉🎉🎉 YAAAAS! Lets get coding 🎉🎉🎉
