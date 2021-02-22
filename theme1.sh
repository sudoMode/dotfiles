# Base 16 Styling
# base00 : Default bakground
# base01 : Light background(Status Bar)
# base02 : Selection background
# base03 : Comments, Invisible, Line Higlights
# base04 : Dark foreground(Status bar)
# base05 : Default foreground, Caret, Delims, Operators
# base06 : Light foreground
# base07 : Light background
# base08 : Markup Tags,Link text, Lists, Diff Deleted, Vars
# base09 : Integres, Boolean, Contants, XML Attributes
# base0A : Classes, Markup Bold, Search Text Background
# base0B : Strings, Inherited Class, Markup Code, Diff Insert
# base0C : Support, Regex, Escape Chars, Markup quotes 
# base0D : Fundtions, Methods, Attributes IDs, Headings
# base0E : Keywords, Storage, Markup Italic, Diff Changed


base00=default   # 000000
base01=colour18  # 282828
base02=colour19  # 383838
base03=colour8   # 585858
base04=colour20  # B8B8B8
base05=colour7   # D8D8D8
base06=colour21  # E8E8E8
base07=colour15  # F8F8F8
base08=colour01  # AB4642
base09=colour16  # DC9656
base0A=colour3   # F7CA88
base0B=colour2   # A1B56C
base0C=colour6   # 86C1B9
base0D=colour4   # 7CAFC2
base0E=colour5   # BA88BAF
base0F=colour17  # A16946


set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# Default status bar color
set-option -g status-fg $base02
set-option -g status-bg $base01
set-option -g status-attr default


# Set window options
set-window-option -g window-status-fg $base04
set-window-option -g window-status-bg $base00
set - window-status-format " #I #W"


# Active window title colors
set-window-option -g window-status-current-fg $base01
set-window-option -g window-status-current-bg $base00
set-window-option -g window-status-current-format " #[bold]#W "


# Pane border colors
set-window-option -g pane-border-fg $base03
set-window-option -g pane-border-bg $base0C


# Clock
set-window-option -g clock-mode-colour $base0C


# Status left
tm_session_name="#[default,bg=$base0E,fg=$base01] #S "
set -g status-left "tm_session_name"


# Music
tm_tunes="#[bg=$base0D,fg=$base01] #(osascript -l JavaScript ~/quickScripts/javaScripts/songReader2.scpt)"

# Battery
tm_battery="#[fg=$base01,bg=$base09] #(battery)"

#  Date
tm_date="#[default,bg=$base02,fg=$base05] %R"

# Host
tm_host="#[fg=$base01,bg=$base0E] #h"

# Status right
set -g status-right "$tm_tunes $tm_battery $tm_date $tm_host"



