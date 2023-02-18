# Create a directory and cd into it. The directory name should be the last
# argument.

function mkcd
    command mkdir $argv && cd $argv[-1]
end
