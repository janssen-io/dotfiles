#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

TTY=$(tty)

if [[ "$TTY" == "/dev/tty1" ]]; then
    if [ -d /etc/X11/xinit/xinitrc.d ]; then
      for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
      done
      unset f
    fi

    exec i3
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
