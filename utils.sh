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

  local status="status-right"

  local status_right="$(geto $status)"

  local new_content="${status_right/$placeholder/$script}"

  seto "$status" "$new_content"
}

get_bash_dir() {
  echo "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
}

debug() {
  tmux display "$1"
}

