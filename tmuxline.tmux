# Separators
set -g @left-separator ""
set -g @right-separator ""

# Colors
set -g @fg "color0"
set -g @bg "color15"
set -g @marker-bg "color9"
set -g @content-bg "color0"

set  -g @icon-style "bold"
set -ag @icon-style " fg=#{@fg}"

set  -g @content-style "nobold"
set -ag @content-style " fg=#{@fg}"
set -ag @content-style " bg=#{@content-bg}"

set  -g @inverted-content-style "fg=#{@content-bg}"
set -ag @inverted-content-style " bg=#{@fg}"

set -g @head-style "bg=default"

set  -g @tail-style "fg=#{@content-bg}"
set -ag @tail-style " bg=default"

set  -g @time "%Y-%m-%d %H:%M"
set -Fg @spotify "#(sh #{d:current_file}/providers/spotify.sh)"

source -F "#{d:current_file}/lib/window.tmux"

run "/home/yuckyh/.config/tmux/plugins/tmuxline/providers/window.sh"

