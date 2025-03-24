function get_indicator() {

    local left_separator=$(geto "@left-separator")
    local right_separator=$(geto "@right-separator")
    local fg=$(geto "@fg")
    local bg=$(geto "@bg")
    local content_bg="$(geto "@content-bg")"

    local wait_color="color9"
    local copy_color="color10"
    local sync_color="color11"

    local content_style="#[fg=default]"
    content_style+="#{?client_prefix,#[bg=$wait_color],"
    content_style+="#{?pane_in_mode,#[bg=$copy_color],"
    content_style+="#{?pane_synchronized,#[bg=$sync_color],"
    content_style+="#[fg=$bg, bg=$content_bg]}}}"

    local content=""
    content+="#{?client_prefix,wait,"
    content+="#{?pane_in_mode,copy,"
    content+="#{?pane_synchronized,sync,"
    content+="tmux}}}"

    local separator_style="#[bg=default]"
    separator_style+="#{?client_prefix,#[fg=$wait_color],"
    separator_style+="#{?pane_in_mode,#[fg=$copy_color],"
    separator_style+="#{?pane_synchronized,#[fg=$sync_color],"
    separator_style+="#[fg=$content_bg]}}}"

    local indicator=""

    indicator+=" "
    indicator+="$separator_style$left_separator"
    indicator+="$content_style"
    indicator+=" $content "
    indicator+="$separator_style$right_separator"
    indicator+=" "

    echo "$indicator"
}

get_indicator
