#!/bin/sh

## Startup Applications
waybar &
foot --server &

## Portals

for portal in xdg-desktop-portal-gtk xdg-desktop-portal-wlr xdg-desktop-portal; do
   pkill -e "$portal"
done

/usr/libexec/xdg-desktop-portal-wlr &
/usr/libexec/xdg-desktop-portal-gtk &

sleep 1

/usr/libexec/xdg-desktop-portal &


## Dbus bullshit
exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
