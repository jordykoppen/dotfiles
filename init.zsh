#!/bin/zsh

# ZSH IS REQUIRED BEFORE INSTALLING THIS
if ! command -v zsh &> /dev/null
then
  echo "ZSH is NOT installed"
  exit
fi

source ./profiles/profile

for file in $DOTFILES/**/install.zsh; do
  echo "Initializing: $file"
  source $file;
done

echo "Initialization done"
