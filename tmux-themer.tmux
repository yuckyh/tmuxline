#!/usr/bin/env bash

source "./utils.sh"

main () {
  local bash_dir="$(get_bash_dir)"

  register_module_placeholder "spotify" "$bash_dir/providers/spotify.sh"

}

main
