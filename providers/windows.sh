source './utils.sh'

build_module() {
    local left_separator=$(geto "@themer-left-separator")
    local right_separator=$(geto "@themer-right-separator")
    local fg=$(geto "@themer-fg")
    local bg=$(geto "@themer-bg")
    local content_bg="$(geto "@themer-content-bg")"

    local index="$1"
    local icon="$2"
    local content="$3"
    local color_index=$((index % 6 + 8))
    local color="color$color_index"

    local module=""

    module+=" "
    module+="#[fg=$color, bg=default]$left_separator"
    module+="#[fg=$bg, bg=$color]"
    module+="$icon "
    module+="#[fg=$fg, bg=$content_bg]"
    module+=" $content"
    module+="#[fg=$content_bg, bg=default]$right_separator"
    module+=" "

    echo "$module"
}
