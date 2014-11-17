#!/bin/bash

HOME_FILES=".bashrc .i3 .vimrc xrandr.sh .Xresources"

if [ ! -e ~/.dotbackup ]; then
    mkdir ~/.dotbackup
fi

for f in $HOME_FILES; do
    if [ -e ~/$f ] && [ ! -h ~/f ]; then
        mv ~/$f ~/.dotbackup/
    fi
    # ln -s $f ~/$f
    cp $f ~/$f
done

echo "Done!" 
