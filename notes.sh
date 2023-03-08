#!/bin/bash
# Sript to open index for notes in a new tmux session with vim.
# I personally bind this script to <M-n> in my os.
kitty tmux new-session -As notes 'vim "$NOTES_DIR/index.md"' 
