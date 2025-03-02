 systemctl --user set-environment DISPLAY=:0
 test -f ~/.Xresources && xrdb -merge -I$HOME ~/.Xresources
 setxkbmap -option 'grp:caps_toggle' -layout 'us,ru'
 slstatus &
 exec dwm
