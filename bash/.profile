#
# ~/.bash_profile
#

test -f ~/.bashrc && . ~/.bashrc
test $(tty) = /dev/tty1 && test -z "$DISPLAY" && startx

