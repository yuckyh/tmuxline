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

register_placeholder() {
  local placeholder="\#{$1}"
  local script="#($2)"
  echo "${/placeholder/script}"
}

get_bash_dir() {
  echo "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
}

debug() {
  tmux display "$1"
}

