#!/usr/bin/env bash

cd /home/psharen/.config
if [[ `git status --porcelain` ]]; then
	/usr/bin/git add . && /usr/bin/git commit -m "backup on $(date)"
	/usr/bin/git push github
fi
