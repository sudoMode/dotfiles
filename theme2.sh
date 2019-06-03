#### COLOUR
green=colour10
dark_grey=colour235
status_bg=colour1
host_color=
red=colour1
color_inactive=colour235
color_feature=colour111
color_music=colour99
color_date=colour58
color_host=colour109
active_border_color=colour240
session_name="#[fg=$color_feature,bold]#S"
black=colour232

# separators
# separator_left_bold="◀"
# separator_left_thin="❮"
# separator_right_bold="▶"
# separator_right_thin="❯"

set -g status-left-length 25
set -g status-right-length 75
set -g status-interval 5

# default statusbar colors
set-option -g status-fg $green
set-option -g status-bg default
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg $color_inactive
set-window-option -g window-status-bg default
set -g window-status-format "#W:#I"

# active window title colors
set-window-option -g window-status-current-fg $red
set-window-option -g window-status-current-bg $dark_grey
set-window-option -g  window-status-current-format "#[bold]#W:#I"

# pane border
set-option -g pane-border-fg $color_inactive
set-option -g pane-active-border-fg $active_border_color

# message text
set-option -g message-bg default
set-option -g message-fg $red

# pane number display
set-option -g display-panes-active-colour $red
set-option -g display-panes-colour $color_inactive

# clock
set-window-option -g clock-mode-colour $green                            
                                     


music="#[fg=$color_music]#(osascript ~/quickScripts/javaScripts/songReader2.scpt)"                        
battery="#[bg=$status_bg]##[fg=$black]#(bash ~/quickScripts/shellScripts/tmuxThemes/battery2.sh)"
date="#[fg=$color_date]%R|%b %d"
host="#[fg=$color_host,bold]#h"
session_name="#[fg=$color_feature,bold]#S"
# kernel="#(system_profiler SPSoftwareDataType | grep -wo "Kernel.*""

set -g status-left $session_name' '
set -g status-right $music' '$kernel' '$date' '$host' '$battery

