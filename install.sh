#!/bin/bash

# Scripts to install
FILES=(gbranch gmerge gpull gpush gpublish gremote)

# Create destination directory
[ $1 ] && dest=$1 || dest="/usr/local/bin"
mkdir -p ${dest}

# Download all scripts
for s in ${FILES[*]}; do
  curl -sS -o ${dest}/${s} https://raw.githubusercontent.com/parrondo/git-simple/master/${s}
  if [ ! -f ${dest}/${s} ]; then
    echo
    echo "Oops! The '${s}' command cannot be copied to ${dest}, installation failed."
    echo "Try to rerun with sudo or specify a custom directory, see for details:"
    echo "https://github.com/parrondo/git-simple#install"
    echo
    exit 1
  fi
  chmod +x ${dest}/${s}
done

# Done!
echo
echo "🎉  git-simple has been installed into ${dest}."
echo "Try typing 'pull' in any Git repository to get started. Run this command again to update."
echo
echo "For more info visit:"
echo "https://github.com/parrondo/git-simple"
echo
