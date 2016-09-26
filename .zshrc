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

function prompt-git-info # {{{
{
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch=${${$(git symbolic-ref -q --short HEAD 2>/dev/null)}:-'(-)'}
  local cdiff=' ' wdiff=' '
  local -a chars
  local -r tab="$(printf '\t')"
  local cchars=${(j::)${(ou)${(@f)"$(git diff --name-status --cached)"}%%$tab*}}
  local wchars=${(j::)${(ou)${(@f)"$(git diff --name-status         )"}%%$tab*}}
  chars=(${cchars} : ${wchars})
  chars=${${(j::)chars}:#:}
  print -f '%s%s' $branch ${chars:+ $chars}
} # }}}

function precmd # {{{
{
  local d='%3~'
  local h=$HISTCMD
  local m=${HOST%%.*}
  local p='%(!~:~.)'
  local u=$USERNAME
  local git="$(prompt-git-info)"
  PROMPT="%S%B%F{yellow}%K{black}$u@$m $d${git:+ $git} %j $h %? $p%f%k%b%s "
} # }}}

alias halt='shutdown -h now'
alias reboot='shutdown -r now'

alias dirs='dirs -v'

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '#### %d ####'

zstyle ':completion:all-matches::::' completer _all_matches _complete
#zstyle ':completion:all-matches:*' old-matches true
zstyle ':completion:all-matches:*' insert true
zle -C all-matches complete-word _generic

