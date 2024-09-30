#!/bin/sh

set -e

cd "$(dirname "$0")/"

find /Library/Java/JavaVirtualMachines/* -maxdepth 0 -print0 | xargs -0 -I {} jenv add {}/Contents/Home
jenv global 17.0
jenv enable-plugin maven
jenv enable-plugin gradle
jenv enable-plugin export

echo ""
echo ""
echo "Remember to enable the jenv plugin"
echo "your .zshrc should look like this `plugins=(git autojump jenv)`"
echo ""
echo ""