#!/usr/bin/env bash

get_spotify () {
  if [ $(pidof spotify | wc -l) -eq 0 ]; then
    echo "No song"

    tmux display "no spotify running"
    return
  fi

  local object="org.mpris.MediaPlayer2.spotify"
  local path="/org/mpris/MediaPlayer2"
  local method="org.freedesktop.DBus.Properties.Get"

  local meta=$(dbus-send --print-reply --dest=$object $path $method string:'org.mpris.MediaPlayer2.Player' string:'Metadata')

  local artist=$(echo "$meta" | grep -m 1 "xesam:artist" -b2 | tail -n1 | grep -o '".*"' | sed 's/"//g') 

  local song_title=$( echo "$meta" | grep -m 1 "xesam:title" -b1 | tail -n1 | grep -o '".*"' | sed 's/"//g')

  local playing=$(dbus-send --print-reply --dest=$object $path $method string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | grep -o Playing)

  if [ "$playing" ]; then
    icon="♫"
  else
    icon="⏸"
  fi

  echo "$icon $artist - $song_title"
}

