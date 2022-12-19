if status is-interactive
    alias ws="watch -n 0.5 sensors"
    alias gdb="gdb --tui"
    alias cl="printf '\033[2J\033[3J\033[1;1H'"
    alias loc="tokei"

    # Usage: ctrlc your/document
    alias ctrlc="xclip -selection clipboard <"
    alias vim="nvim"
    alias v="nvim"
    alias neovide="neovide --multigrid"

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

set -gx DENO_INSTALL "/home/psharen/.deno"
set -gx FLYCTL_INSTALL "/home/psharen/.fly"

# pnpm
set -gx PNPM_HOME "/home/psharen/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end