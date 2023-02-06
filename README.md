# mpv-midi-controller

This is my hack for [BHNT85](https://github.com/berlin-hack-and-tell/berlinhackandtell.rocks/pull/351).

## Enable IPC server on MPV

Edit your mpv config (mine is in `~/.config/mpv/mpv.conf`) and add:

```
input-ipc-server=/tmp/mpvsocket
```

## Use MPV to listen do Bandcamp

`lynx -dump -listonly -nonumbers https://daily.bandcamp.com/best-ambient/the-best-ambient-on-bandcamp-january-2023 | grep "https://.*.bandcamp.com/album/" | sort | uniq | shuf | xargs -n1 mpv --no-audio-display`

## Connect your MIDI controller and check how's mapped

```
aconnect -i
```

In my case, the output is:

```
client 0: 'System' [type=kernel]
    0 'Timer           '
    1 'Announce        '
client 14: 'Midi Through' [type=kernel]
    0 'Midi Through Port-0'
client 24: 'nanoPAD' [type=kernel,card=2]
    0 'nanoPAD nanoPAD _ CTRL'
```

## Configure and run `midi.sh`

Download `midi.sh` and change the name of your MIDI input at the line `aseqdump -p`, my input is a `nanoPAD`, put there the name of your controller, then run `./midi.sh`.

## BE EXCELLENT TO EACH OTHER

Always buy the music you like. Bandcamp is all about supporting artists, don't be like spotify, support your favorite musicians. I mapped one of the pads to open the current song on Firefox, in this way it's easier to add it to your favorites or buy it.
