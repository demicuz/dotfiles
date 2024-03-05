if status is-interactive
    alias mn="mv -vn"
    alias latch="ls -latch"

    alias neovide="neovide --multigrid"

    alias vim="nvim"
    alias v="nvim"
    alias r="ranger"
    alias loc="tokei"

    alias git-graph="git log --graph --pretty=format:\"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%ae>%Creset\" --abbrev-commit --all"
    alias git-prune="git fetch --prune && git branch -lvv | cut -c3- | awk '/: gone]/ {print \$1}' | xargs git branch -d"
    alias my-ip="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com" # https://apple.stackexchange.com/a/20553

    set -Ux BAT_THEME "ansi"

    abbr -a -- gcm 'git checkout master'
    abbr -a -- gs 'git status'
    abbr -a -- gp 'git pull --ff-only'
    abbr -a -- recent-files 'gfind . -type f -not -path "*/.*" -printf "%T@ %Tc %p\n" | sort -rn | cut -d" " -f2- | head -n 30'

    abbr -a --position anywhere -- gst 'git stash'
end

set -gx EDITOR nvim
