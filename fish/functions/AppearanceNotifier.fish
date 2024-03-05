function AppearanceNotifier --wraps=AppearanceNotifier
    command AppearanceNotifier $argv >/dev/null 2>&1 &
    disown
end
