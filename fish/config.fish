if status is-interactive
    eval (batpipe)

    alias ws="watch -n 0.5 sensors"
    # Usage: ctrlc your/document
    alias ctrlc="xclip -selection clipboard <"
    # alias ls="ls --hyperlink=auto"

    alias gdb="gdb --tui"
    alias neovide="neovide --multigrid"

    alias vim="nvim"
    alias v="nvim"
    alias loc="tokei"

    alias cl="printf '\033[2J\033[3J\033[1;1H'"

    # OpenVPN aliases
    alias polytech_connect="openvpn3 session-start --config MoscowPolytech-pure.demicube@gmail.com.ovpn"
    alias polytech_disconnect="openvpn3 session-manage -c MoscowPolytech-pure.demicube@gmail.com.ovpn -D"
    alias polytech_stats="openvpn3 session-stats -c MoscowPolytech-pure.demicube@gmail.com.ovpn"
    alias polytech_log="openvpn3 log -c MoscowPolytech-pure.demicube@gmail.com.ovpn"

    alias polytech_server="openvpn3 session-start --config MoscowPolytech-pure.demicube@gmail.com.ovpn && ssh -p 22 -l std std-1746.ist.mospolytech.ru"

    alias 21_connect="openvpn3 session-start --config school21.ovpn"
    alias 21_disconnect="openvpn3 session-manage -c school21.ovpn -D"
    alias 21_stats="openvpn3 session-stats -c school21.ovpn"
    alias 21_log="openvpn3 log -c school21.ovpn"
end

set -gx EDITOR nvim
set -gx PNPM_HOME "/home/psharen/.local/share/pnpm"
