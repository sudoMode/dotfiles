#### COLOURS
white=colour15
green=colour10
dark_grey=colour235
status_bg=colour1
host_color=colour123
red=colour1
dirty_blue=colour23
color_inactive=colour242
color_feature=colour111
color_music=colour99
color_date=colour240
color_host=colour180
color_session=colour182
active_border_color=colour255
black=colour256
hour=colour240
minute=colour245
second=colour250

# separators
separator_left_bold="◀"
separator_left_thin="❮"
separator_right_bold="▶"
separator_right_thin="❯"

set -g status-left-length 60
set -g status-right-length 120
set -g status-interval 2

# default statusbar colors
set-option -g status-style fg=$red

# default window title colors
set-window-option -g window-status-style fg=$color_inactive,bg=default
set -g window-status-format "#W"

# active window title colors
set-window-option -g window-status-current-style fg=$red,bg=default
set-window-option -g  window-status-current-format "#[bold]#W"

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
set-option -g display-time 333

# clock
set-window-option -g clock-mode-colour $red

# status bar update inetrval
set -g status-interval 1

# status left
# session_name="#[fg=$color_session,bold]#S ☘︎"
session_name="🍄"

# status right (obsolete)
# battery="#[bg=$status_bg]##[fg=$black]#(source ~/.config/tmux/themes/battery2.sh)"
# battery="#[fg=$black,bg=$status_bg]#(pmset -g batt | grep -ow '\d\+\%')"
# uptime="#[fg=red,dim,bg=default]#(uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',')"
# kernel="#(system_profiler SPSoftwareDataType | grep -wo "Kernel.*""
# memory="#[fg=green]#(tmux-mem-cpu-load -c -q -g 5 -m 2 -t 0)"
# git='#(python3 ~/.config/tmux/themes/git.py -p #{pane_current_path})'


# status-right
music="#[fg=$color_music]#(osascript ~/.config/tmux/themes/songReader.js)#[fg=colour9] "
git='#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)'
venv='#(echo $VIRTUAL_ENV)'
date="#[fg=$color_date]%m#[fg=$white]|#[fg=$color_date]%d "
time="#[fg=$hour]%H#[fg=$minute]%M#[fg=$second]%S#[fg=colour9]"
host="#[fg=$color_host,bg=$dark_grey]#h"


set -g status-left $session_name' '
set -g status-right $music' '$date$time' '$host
