#!/bin/bash

# From: https://superuser.com/a/1170232

# Check midi inputs:
# aconnect -i

aseqdump -p "nanoPAD" | \
while IFS=" ," read src ev1 ev2 ch label1 data1 label2 data2 rest; do
    case "$ev1 $ev2 $data1" in
        "Note on 36" )
                echo "Play/pause: $ev1 $ev2 $data1"
		echo cycle pause | socat - /tmp/mpvsocket ;;
        "Note on 38" )
                echo "Previous: $ev1 $ev2 $data1"
		echo playlist_prev | socat - /tmp/mpvsocket ;;
        "Note on 40" )
                echo "Next: $ev1 $ev2 $data1"
		echo playlist_next | socat - /tmp/mpvsocket ;;
        "Note on 44" )
                echo "Open song: $ev1 $ev2 $data1"
		echo '{ "command": ["get_property", "path"] }' | socat - /tmp/mpvsocket | jq .data | xargs firefox -new-tab & ;;
        "Note on 46" )
                echo "Volume down: $ev1 $ev2 $data1"
		pactl set-sink-volume @DEFAULT_SINK@ -10% ;;
        "Note on 49" )
                echo "Volume up: $ev1 $ev2 $data1"
		pactl set-sink-volume @DEFAULT_SINK@ +10% ;;
        * )
                echo "???: $ev1 $ev2 $data1"
    esac
done
