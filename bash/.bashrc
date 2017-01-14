#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

wal -r

export EDITOR='/usr/bin/vim'
alias ls='ls --color=auto'
alias please='sudo $(history -p !!)'
alias logout='i3-msg exit'
alias walnow='wal -i "$HOME/Pictures/Wallpapers"'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

function mkcd {
    mkdir $1
    cd $1
}

# PS1='[\u@\h \W]\$ ' # DEFAULT PS1
function color_my_prompt {
	# credit to: http://stackoverflow.com/a/6086978
    local __user_and_host="\[\033[0;32m\]\u@\h"
    local __cur_location="\[\033[0;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

