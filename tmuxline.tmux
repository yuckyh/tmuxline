#!/usr/bin/env bash

source "./utils.sh"

build_indexed_status_right() {
  echo
}

main () {
  local bash_dir="$(get_bash_dir)"

  register_module_placeholder "spotify" "$bash_dir/providers/spotify.sh" "status-right"
}

main
