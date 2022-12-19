function fish_right_prompt
    # set -g __fish_git_prompt_showdirtystate 1
    # set -g __fish_git_prompt_showuntrackedfiles 1
    # set -g __fish_git_prompt_showupstream informative
    # set -g __fish_git_prompt_showcolorhints 1
    # set -g __fish_git_prompt_use_informative_chars 1

    # Unfortunately this only works if we have a sensible locale
    # string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL
    # and set -g __fish_git_prompt_char_dirtystate \U1F4a9
    # set -g __fish_git_prompt_char_untrackedfiles "?"

    # set -l vcs (fish_vcs_prompt 2>/dev/null)

    set -l d (set_color brgrey)(date "+%R")(set_color normal)

    # set -l duration "$cmd_duration$CMD_DURATION"
    set -l duration
    if test $CMD_DURATION -gt 1000
        set -l secs (math --scale=1 $CMD_DURATION/1000 % 60)
        set -l mins (math --scale=0 $CMD_DURATION/60000 % 60)
        set -l hours (math --scale=0 $CMD_DURATION/3600000)

        test $hours -gt 0 && set --append duration $hours"h"
        test $mins -gt 0 && set --append duration $mins"m"
        test $secs -gt 0 && set --append duration $secs"s"
    else
        set duration
    end

    # set -q VIRTUAL_ENV_DISABLE_PROMPT
    # or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    # set -q VIRTUAL_ENV
    # and set -l venv (string replace -r '.*/' '' -- "$VIRTUAL_ENV")

    set_color reset
    string join " " -- $duration $d
end
