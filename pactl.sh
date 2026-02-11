#!/bin/sh

pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name=input-ultimate sink_properties=device.description="input-ultimate"
pactl load-module module-loopback media.class=Audio/Sink sink_name=loopback sink_properties=device.description="loopback"

pactl set-default-source input-ultimate

pactl set-source-volume input-ultimate 100%

carla ~/carla.carxp -n

pactl unload-module module-null-sink
pactl unload-module module-loopback
