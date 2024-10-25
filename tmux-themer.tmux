#!/usr/bin/env bash

source "./utils.sh"

main () {
  debug "hello world!"

  seto "@spotify" "$(get_bash_dir)/providers/spotify.sh"
}

main
