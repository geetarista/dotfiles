#!/bin/sh

# This installation is destructive, as it removes exisitng files/directories.
# Use at your own risk.

for name in *; do
  if [ ! $name == "README.md" -a ! $name == "LICENSE" -a ! $name == "install.sh" ]; then
    target="$HOME/.$name"

    if [ -h $target ]; then
      rm $target
    elif [ -d $target ]; then
      rm -rf $target
    fi

    ln -s "$PWD/$name" "$target"
    echo "Linked $PWD/$name to $target."
  fi
done
