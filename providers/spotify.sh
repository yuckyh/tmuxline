#!/usr/bin/env bash

get_spotify () {
  if [ $(pidof spotify | wc -l) -eq 0 ]; then
    echo "No song"

    tmux display "no spotify running"
    return
  fi

  local dest="org.mpris.MediaPlayer2.spotify"
  local path="/org/mpris/MediaPlayer2"
  local method="org.freedesktop.Properties.Get"

  local META=$( dbus-send --print-reply --dest=$dest $path $method string:'org.mpris.MediaPlayer2.Player' string:'Metadata')

  local ARTIST=$( echo "$META" | grep -m 1 "xesam:artist" -b2 | tail -n1 | grep -o '".*"' | sed 's/"//g' ) 

  local SONG_TITLE=$( echo "$META" | grep -m 1 "xesam:title" -b1 | tail -n1 | grep -o '".*"' | sed 's/"//g' )

  local PLAYING=$( dbus-send --print-reply --dest=$dest $path $method string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | grep -o Playing )

  if [ "$PLAYING" ]; then
    ICON="♫"
  else
    ICON="⏸"
  fi

  echo "$ICON $ARTIST - $SONG_TITLE"
}

get_spotify
