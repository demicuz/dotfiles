#!/usr/bin/env fish

set SOCK "$XDG_RUNTIME_DIR/kitty.sock"

if test -S $SOCK
	kitty @ --to "unix:$SOCK" focus-window
else
	kitty --listen-on="unix:$SOCK" &; disown;
	while not test -S "$SOCK";
		sleep 0.1;
	end
end

# kitty @ --to "unix:$SOCK" send-text "make -f $PWD/Makefile && $PWD/3DViewer\n"
kitty @ --to "unix:$SOCK" send-text $argv
