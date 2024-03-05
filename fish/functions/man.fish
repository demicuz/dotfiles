function man
    if test $COLUMNS -gt 80
        set -gx MANWIDTH 80
    else
        set -gx MANWIDTH $COLUMNS
    end
    # command man --no-hyphenation --no-justification $argv
    command batman $argv
end