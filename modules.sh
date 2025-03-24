build_module() {
  local left_separator=$(geto "@left-separator")
  local right_separator=$(geto "@right-separator")
  local fg=$(geto "@fg")
  local bg=$(geto "@bg")
  local content_bg="$(geto "@content-bg")"

  local icon="$1"
  local content="$2"
  local content_fg="$3"

  local module=""

  module+=" "
  module+="#[fg=$content_fg, bg=default]$left_separator"
  module+="#[fg=$bg, bg=$content_fg]"
  module+="$icon "
  module+="#[fg=$fg, bg=$content_bg]"
  module+=" $content"
  module+="#[fg=$content_bg, bg=default]$right_separator"
  module+=" "

  echo "$module"
}
