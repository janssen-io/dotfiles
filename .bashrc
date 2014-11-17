#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

xset -b
xrandr --output LVDS1 --mode 1920x1080 --primary
xrandr --output HDMI1 --mode 1360x768 --left-of LVDS1 --auto
xrandr --output VGA1  --mode 1920x1080 --right-of LVDS1 --auto


alias ls='ls --color=auto'
alias please='sudo $(history -p !!)'

alias sourcex='xrdb -merge ~/.Xresources'
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


# http://madebynathan.com/2011/10/04/a-nicer-way-to-use-xclip/
# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
# Check that xclip is installed.
if ! type xclip > /dev/null 2>&1; then
echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
# Check user is not root (root doesn't have access to user xorg server)
elif [[ "$USER" == "root" ]]; then
echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
else
# If no tty, data should be available on stdin
if ! [[ "$( tty )" == /dev/* ]]; then
input="$(< /dev/stdin)"
# Else, fetch input from params
else
input="$*"
fi
if [ -z "$input" ]; then  # If no input, print usage message.
echo "Copies a string to the clipboard."
echo "Usage: cb <string>"
echo "       echo <string> | cb"
else
# Copy input to clipboard
echo -n "$input" | xclip -selection c
# Truncate text for status
if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
# Print status.
echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
fi
fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }  
# Copy SSH public key
alias cbssh="cbf ~/.ssh/id_rsa.pub"  
# Copy current working directory
alias cbwd="pwd | cb"  
# Copy most recent command in bash history
alias cbhs="cat $HISTFILE | tail -n 1 | cb"  # A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
# Check that xclip is installed.
if ! type xclip > /dev/null 2>&1; then
echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
# Check user is not root (root doesn't have access to user xorg server)
elif [[ "$USER" == "root" ]]; then
echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
else
# If no tty, data should be available on stdin
if ! [[ "$( tty )" == /dev/* ]]; then
input="$(< /dev/stdin)"
# Else, fetch input from params
else
input="$*"
fi
if [ -z "$input" ]; then  # If no input, print usage message.
echo "Copies a string to the clipboard."
echo "Usage: cb <string>"
echo "       echo <string> | cb"
else
# Copy input to clipboard
echo -n "$input" | xclip -selection c
# Truncate text for status
if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
# Print status.
echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
fi
fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }  
# Copy SSH public key
alias cbssh="cbf ~/.ssh/id_rsa.pub"  
# Copy current working directory
alias cbwd="pwd | cb"  
# Copy most recent command in bash history
alias cbhs="cat $HISTFILE | tail -n 1 | cb"  
