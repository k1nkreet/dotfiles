test -f ~/.Xresources && xrdb -merge -I$HOME ~/.Xresources
slstatus &
exec dwm
