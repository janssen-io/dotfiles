#!/bin/bash

for f in * .[^.]*; do
    ln -s $f ~/$f
done

echo "Done!" 
