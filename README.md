# vimconfig
Configuration files for vim and tmux

# ZSH config

to insert at the end of `~/.zshrc`
```
[[ $TERM != "screen" ]] && exec tmux

if command -v tmux &> /dev/null && [ -n "$PS1"  ] && [[ ! "$TERM" =~ screen  ]] && [[ ! "$TERM" =~ tmux  ]] && [ -z "$TMUX"  ]; then
	  exec tmux
fi
```
