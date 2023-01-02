# Pipe `make` output to a special script that makes errors from gcc/clang
# clickable. Opens corresponding files in Sublime Text, sets cursor on the right
# position.

function make
    command make $argv 2>| gcc-sublime-links
end
