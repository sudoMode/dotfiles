function fish_prompt
    # This prompt shows:
    # - green lines if the last return command is OK, red otherwise
    # - your user name, in red if root or yellow otherwise
    # - your hostname, in cyan if ssh or blue otherwise
    # - the current path (with prompt_pwd)
    # - date +%X
    # - the current virtual environment, if any
    # - the current git status, if any, with fish_git_prompt
    # - the current battery state, if any, and if your power cable is unplugged, and if you have "acpi"
    # - current background jobs, if any

    # It goes from:
    # ┬─[nim@Hattori:~]─[11:39:00]
    # ╰─>$ echo here

    # To:
    # ┬─[nim@Hattori:~/w/dashboard]─[11:37:14]─[V:django20]─[G:master↑1|●1✚1…1]─[B:85%, 05:41:42 remaining]
    # │ 2	15054	0%	arrêtée	sleep 100000
    # │ 1	15048	0%	arrêtée	sleep 100000
    # ╰─>$ echo there
    # 🐠 ⋘ ⋙ ⨳ ⨴ ⨵ ⩤ ⩥ ⫷ ⫸ ⟚ 
    # ⟦ ⟧ ⟤ ⟥ ⟢ ⟣ ⟡ ⦕ ⦖ ⦓ ⦔ ❖ ✥ 
    # ❈ ➺⟿⇝⤕⤁↬⤛↭≪

    set -l retc 1a1919
    test $status = 0; and set retc 1a1919  # dark grey

    set -q __fish_git_prompt_showupstream
    or set -g __fish_git_prompt_showupstream auto

    function _nim_prompt_wrapper
        set retc $argv[1]
        set left $argv[2]
        set field_name $argv[3]
        set field_value $argv[4]
        set right $argv[5]

        set_color normal
        set_color $retc
        # echo -n ' '
        set_color -o 3f4745  # dark grey
        echo -n $left
        set_color 1a1919
        test -n $field_name
        and echo -n $field_name':'
        set_color $retc
        echo -n $field_value
        set_color -o 3f4745  # dark grey
        echo -n $right
    end

    # set_color $retc
    # echo -n '┬─'
    # set_color -o green
    # echo -n [

    # user name
    if test "$USER" = "mandeepsingh"
        set_color -o 717575  # grey
        echo -n "⪻"
        set_color -o 852311  # maroon
        echo -n sudoMode
        set_color -o 717575  # grey
        echo -n "⪼"
    else
        set_color -o blue
        echo -n "<<"
        set_color -o yellow
        echo -n $USER
        set_color -o blue
        echo -n ">>"
    end

    # separator
    set_color -o ffa329  # yellow
    echo -n ' ⨳ '  # ⋮ ⟕ ⟖ ⟗ ⟚ ⟛ ⟜

    # hostname
    # if [ -z "$SSH_CLIENT" ]
        # set_color -o yellow
    # else
        # set_color -o cyan
    # end
    # echo -n (prompt_hostname)

    # working directory
    set_color -o 267dc4  # blue
    echo -n (prompt_pwd)
    set_color -o white
    echo -n '⑆ '

    # git branch
    set prompt_git (fish_git_prompt | string trim -c ' (>|=)')
    test -n "$prompt_git"
    and _nim_prompt_wrapper 946d50 '' 𝐆 $prompt_git ''
    set_color -o 2f145e
    echo -n '⋄⋄⋄'

    # virtual environment
    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and _nim_prompt_wrapper 839475 '' 𝐕 (basename "$VIRTUAL_ENV") ''
    set_color -o 2f145e
    echo -n '⋄⋄⋄'

    # time
    # _nim_prompt_wrapper $retc '⧼' '' (date +%m/%d⚚%H⦂%M⦂%S) '⧽' 
    set_color -o 3f4745
    echo -n '⧼'
    set_color -o 1a1919
    echo -n (date +%m/%d)
    set_color -o 3f4745  #ffa329
    echo -n ⚚
    set_color -o 1a1919
    echo -n (date +%H⦂%M⦂%S)
    set_color -o 3f4745
    echo -n '⧽'

    # battery status
    # type -q acpi
    # and test (acpi -a 2> /dev/null | string match -r off)
    # and _nim_prompt_wrapper $retc B (acpi -b | cut -d' ' -f 4-)

    # New line
    echo

    # background jobs
    # set_color normal
    # for job in (jobs)
        # set_color $retc
        # echo -n '│ '
        # set_color brown
        # echo $job
    # end

    # set_color normal
    # set_color $retc
    # echo -n '╰─>'
    # set_color -o red
    # echo -n '$ '
    # set_color normal
    echo '🐠 '
end
