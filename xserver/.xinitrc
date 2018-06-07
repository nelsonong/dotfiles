#!/bin/sh
## Update Colors
xrdb -load $HOME/.Xresources

## Fonts
xset +fp $HOME/.fonts
xset fp rehash

## Change Keyboard
setxkbmap -option terminate:ctrl_alt_bksp

## Change Color Range
xrandr --output eDP1 --set "Broadcast RGB" "Full"

## Change cursor
xsetroot -cursor_name left_ptr

## Wallpaper
xsetroot -mod 10 2 -bg "$(xrdb -query|awk '/^\*color0:/ {print $2}')" -fg "$(xrdb -query|awk '/^\*color8:/ {print $2}')"

## Numlock
numlockx &

## Mpd
mpd &

## Polybar
bar &
#polybar main &

## Urxvt Daemon
urxvtd -q -f -o &

## Sxhkd
sxhkd &

## Redshift
redshift &

## Wm
exec bspwm
