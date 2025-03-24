geto () {
  tmux show -gv "$1"
}

getw () {
  tmux showw -gv "$1"
}

seto () {
  tmux set -gq "$1" "$2"
}

seta () {
  tmux set -agq "$1" "$2"
}

setw () {
  tmux setw -gq "$1" "$2"
}

register_module_placeholder() {
  local placeholder="\#{$1}"
  local script="#($2)"
  local property="$3"

  local content="$(geto $property)"

  local new_content="${content/$placeholder/$script}"

  seto "$property" "$new_content"
}

get_theme_config() {
  local -n config=$1
  local left_separator=$(geto "@left-separator")
  local right_separator=$(geto "@right-separator")
  local fg=$(geto "@fg")
  local bg=$(geto "@bg")
  local content_bg="$(geto "@content-bg")"

  config=($left_separator $right_separator $fg $bg $content_bg)
}

get_bash_dir() {
  echo "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
}

debug() {
  tmux display "$1"
}

