#!/bin/sh

pactl load-module module-null-sink media.class=Audio/Sink sink_name=output-ultimate
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name=input-ultimate

pactl set-default-sink output-ultimate
pactl set-default-source input-ultimate

pactl set-sink-volume output-ultimate 100%
pactl set-source-volume input-ultimate 100%

carla ~/carla.carxp -n

pactl unload-module module-null-sink
