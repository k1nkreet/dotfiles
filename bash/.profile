#
# ~/.bash_profile
#

test -f ~/.bashrc && . ~/.bashrc
test $(tty) = /dev/tty1 && test -z "$DISPLAY" && startx

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
