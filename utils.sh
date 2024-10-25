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
  echo "#{$1}#($2)"
}

debug() {
  tmux display "$1"
}

