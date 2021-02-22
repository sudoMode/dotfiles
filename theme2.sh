#### COLOURS
green=colour10
dark_grey=colour235
status_bg=colour1
host_color=
red=colour1
dirty_blue=colour23
color_inactive=colour235
color_feature=colour111
color_music=colour99
color_date=colour58
color_host=colour109
active_border_color=colour240
session_name="#[fg=$color_feature,bold]#S"
black=colour232

# separators
separator_left_bold="◀"
separator_left_thin="❮"
separator_right_bold="▶"
separator_right_thin="❯"

set -g status-left-length 25
set -g status-right-length 75
set -g status-interval 5

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

music="#[fg=$color_music]#(osascript ~/quickScripts/javaScripts/songReader2.scpt)"
battery="#[bg=$status_bg]##[fg=$black]#(bash ~/quickScripts/shellScripts/tmuxThemes/battery2.sh)"
date="#[fg=$color_date]%R|%b %d"
host="#[fg=$color_host,bold]#h"
session_name="#[fg=$color_feature,bold]#S"
# kernel="#(system_profiler SPSoftwareDataType | grep -wo "Kernel.*""

set -g status-left $session_name' '
set -g status-right $music' '$date' '$host' '$battery
