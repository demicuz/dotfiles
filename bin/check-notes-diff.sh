#!/usr/bin/env bash

set -e

cd /home/psharen/Documents/notes/demicuz.github.io/content
ls *.md > demicuz-notes.txt
mv demicuz-notes.txt /home/psharen/
cd /home/psharen/Documents/notes/obsidian-notes
ls *.md > obsidian-notes.txt
mv obsidian-notes.txt /home/psharen
cd /home/psharen
diff demicuz-notes.txt obsidian-notes.txt
rm demicuz-notes.txt obsidian-notes.txt
