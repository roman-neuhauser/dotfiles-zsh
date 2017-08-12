# vim: sts=2 sw=2 fdm=marker cms=\ #\ %s

# load completion system
autoload -U compinit; compinit

# set the Emacs-like key bindings
bindkey -e

bindkey '^D' list-choices 

# two backspace keys? which !#$%er had this idea?
case "$(uname)" in
[Ll]inux) ;;
*)
  bindkey '^?' delete-char ;;
esac

WORDCHARS=${WORDCHARS:gs,/,,}

autoload backward-kill-word-match
zle -N backward-kill-word backward-kill-word-match
bindkey '^W' backward-kill-word

bindkey \\en history-beginning-search-forward
bindkey \\ep history-beginning-search-backward

# ^S supresses tty output, and I don't want to mess with that setting
bindkey '^Xr' history-incremental-search-forward

autoload predict-on
zle -N predict-on
zle -N predict-off
bindkey '^Xp' predict-on
bindkey '^X^P' predict-off

bindkey '^Xx' all-matches

# list of suffices to ignore when completing filenames
fignore=(\~ \.swp)

alias halt='shutdown -h now'
alias reboot='shutdown -r now'

alias dirs='dirs -v'

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '#### %d ####'

zstyle ':completion:all-matches::::' completer _all_matches _complete
#zstyle ':completion:all-matches:*' old-matches true
zstyle ':completion:all-matches:*' insert true
zle -C all-matches complete-word _generic

declare hookd=~/.zsh/hooks

fpath=($hookd $fpath)

autoload -Uz $hookd/*(.:t)
