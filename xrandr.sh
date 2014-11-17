#!/bin/bash
IN="LVDS1"
EXT=$1
RES=$2

xrandr --output $IN --mode 1920x1080 --primary
xrandr --output $EXT --mode $RES --left-of $IN 

