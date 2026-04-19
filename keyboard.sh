#!/bin/sh

if [ $1 == 'on' ]; then
    hyprctl keyword device[at-translated-set-2-keyboard]:enabled true
elif [ $1 == 'off' ]; then
    sleep 0.05 # sleep to avoid the input not being flushed in time
    hyprctl keyword device[at-translated-set-2-keyboard]:enabled false
fi
