# vimconfig
Configuration files for vim and tmux


## get .vimrc

```
curl -O https://raw.githubusercontent.com/avkudr/dotfiles/main/.vimrc
```

## get .tmux.conf
```
curl -O https://raw.githubusercontent.com/avkudr/dotfiles/main/.tmux.conf
```

# ZSH config

to insert at the end of `~/.zshrc`
```
if command -v tmux &> /dev/null && [ -n "$PS1"  ] && [[ ! "$TERM" =~ screen  ]] && [[ ! "$TERM" =~ tmux  ]] && [ -z "$TMUX"  ]; then
	exec tmux -2
fi
```
