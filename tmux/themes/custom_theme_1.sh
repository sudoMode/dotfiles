#### COLOURS
green=colour10
dark_grey=colour235
status_bg=colour1
host_color=colour123
red=colour1
dirty_blue=colour23
color_inactive=colour235
color_feature=colour111
color_music=colour99
color_date=colour58
color_host=colour143
active_border_color=colour240
session_name="#[fg=$color_feature,bold]#S"
black=colour256

# separators
separator_left_bold="◀"
separator_left_thin="❮"
separator_right_bold="▶"
separator_right_thin="❯"

set -g status-left-length 60
set -g status-right-length 120
set -g status-interval 1

# copy-mode style
set-window-option -g mode-style fg=$red,bg=$dark_grey

# default statusbar colors
set-option -g status-style fg=$red

# default window title colors
set-window-option -g window-status-style fg=$color_inactive,bg=default
set -g window-status-format "#W:#I"

# active window title colors
set-window-option -g window-status-current-style fg=$red,bg=$dark_grey
set-window-option -g  window-status-current-format "#[bold]#W:#I"

# default pane style
set-option -g pane-border-status off
set-option -g pane-border-style fg=$color_inactive

# active pane style
set-option -g pane-active-border-style fg=$dirty_blue

# pane number display
set-option -g display-panes-active-colour $red
set-option -g display-panes-colour $color_inactive

# message text
set-option -g message-style fg=$red,bg=default
set-option -g display-time 666

# clock
set-window-option -g clock-mode-colour $green

# status left
session_name="#[fg=$color_feature,bold]#S"

# status right
music="#[fg=$color_music]#(osascript ~/.config/tmux/themes/songReader.js)#[fg=colour9] |"
# battery="#[bg=$status_bg]##[fg=$black]#(source ~/.config/tmux/themes/battery2.sh)"
# battery="#[fg=$black,bg=$status_bg]#(pmset -g batt | grep -ow '\d\+\%')"
# uptime="#[fg=red,dim,bg=default]#(uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',')"
# kernel="#(system_profiler SPSoftwareDataType | grep -wo "Kernel.*""
date="#[fg=$color_date]%b %d #[fg=colour9]|"  # %H:%M"
host="#[fg=$color_host,bold]#h"
memory="#[fg=green]#(tmux-mem-cpu-load -c -q -m 2 -a 0)"

set -g status-left $session_name' '
set -g status-right $music' '$date' '$host' 
