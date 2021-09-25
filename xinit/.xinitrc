systemctl --user set-environment DISPLAY=:0
test -f ~/.Xresources && xrdb -merge -I$HOME ~/.Xresources
slstatus &
exec dwm
