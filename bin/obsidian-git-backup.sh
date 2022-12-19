#!/usr/bin/env bash

cd /home/psharen/Documents/notes/obsidian-notes
if [[ `git status --porcelain` ]]; then
	/usr/bin/git add . && /usr/bin/git commit -m "backup on $(date)"
	/usr/bin/git push github
	/usr/bin/git push gitlab
fi
