# vim: sts=2 sw=2 fdm=marker cms=\ #\ %s

declare -x EDITOR=vim
declare -x VISUAL=vim

declare -x LANG=en_US.UTF-8
declare -x LC_COLLATE=C
declare -x LC_CTYPE=en_US.UTF-8
declare -x LC_MESSAGES=en_US.UTF-8
declare -x LC_NUMERIC=en_US.UTF-8
declare -x LC_TIME=en_US.UTF-8

declare -x PATH
[[ -n ${path[(r)$HOME/bin]} ]] || path=(~/bin $path)

declare HISTFILE=~/.zshistory
declare HISTSIZE=1200
declare SAVEHIST=1000

# ignore system-wide configuration, it's only trouble
unsetopt GLOBAL_RCS

# DEFAULT zsh sessions append history list to the history file rather
# than overwrite it
setopt appendhistory
# if a command is issued that can't be executed as a normal command,
# and the command is the name of a directory, cd to that directory
setopt autocd
# DEFAULT automatically list choices on an ambiguous completion
setopt autolist
# make `cd` push the old directory onto the directory stack
setopt autopushd
# DEFAULT error out on malformed patterns
setopt badpattern
# do not beep on error in ZLE
setopt nobeep
# do not lower the prio of background jobs
setopt nobgnice
# DEFAULT case-sensitive globbing
setopt casematch
# output hex numbers in the standard C format ('0xFF' instead of
# '16#FF'). if octalzeroes is also set (not by default), octal numbers
# will be treated similarly ('077' insead of '8#77'). input is
# understood irrespective of this setting
setopt cbases
# report the status of background and suspended jobs before exiting a
# shell; a second attempt to exit the shell will succeed
setopt checkjobs
# prevents '>' redirection from truncating existing files, and '>>'
# from creating files
setopt noclobber
# leave cursor in its position when completion is started, and attempt
# completion from both ends
setopt completeinword
# correct spelling of commands
setopt correct
# history reference without an event specifier always refers to the
# previous command. (off: such a history reference refers to the same
# event as the previous history reference)
setopt cshjunkiehistory
# remove patterns matching no files form command, complain only if
# *all* patterns fail
setopt cshnullglob
# DEFAULT perform '=' filename expansion
setopt equals
# globbing for grownups, see *extended* discussion in zshexpn(1)
setopt extendedglob
# save each command's beginning timestamp and duration to $HISTFILE
setopt extendedhistory
# DEFAULT do globbing
setopt glob
# DEFAULT glob leading '.' only explicitely
setopt noglobdots
# DEFAULT don't glob results of parameter expansions
setopt noglobsubst
# cache the location of each command the first time it's run
setopt hashcmds
# DEFAULT note the location of each command the first time it is
# executed. subsequent invocations will use the saved location,
# avoiding a path search
setopt hashcmds
# DEFAULT whenever a command name is hashed, hash the directory
# containing it, as well as all directories earlier in the path
setopt hashdirs
# DEFAULT offer only hashed paths to complete/correct
setopt hashlistall
# add '|' to output redirections in the history. this allows history
# references to clobber files even when clobber is unset
setopt histallowclobber
# do not beep on accessing a nonexistent history entry
setopt nohistbeep
# do not display duplicates when searching for history entries in the ZLE
setopt histfindnodups
# do not enter command lines into the history list if they're
# duplicates of the previous event
setopt histignoredups
# do not store the 'history' command in the history list
setopt histnostore
# remove superfluous blanks from command lines being added to the
# history lsit
setopt histreduceblanks
# when the user enters a line with history expansion, don't execute
# it; instead, perform history expansion and reload the line into the
# editing buffer
setopt histverify
# do not SIGHUP running jobs when the shell exits
setopt nohup
# allow comments in interactive shells
setopt interactivecomments
# FIXME effects?
setopt nolistambiguous
# try to make the completion ist smaller by printing the matches in
# columns with different widths
setopt listpacked
# DEFAULT when listing file completions, show the type with trailing
# identifiers (`ls -F`)
setopt listtypes
# list jobs in the long format
setopt longlistjobs
# All unquoted arguments of the form `anything=expression' appearing
# after the command name have filename expansion (that is, where
# expression has a leading `~' or `=') performed on expression as if it
# were a parameter assignment. The argument is not otherwise treated
# specially; it is passed to the command as a single argument, and not
# used as an actual parameter assignment.
setopt magic_equal_subst
# perform implicit tee(1)s or cat(1)s when attempting multiple redirections;
# see the Redirection section in zshmisc(1)
setopt multios
# interpret any integer constant beginning with 0 as octal, per POSIX.2
setopt octalzeroes
# perform a path search even on command names with slashes in them
# with /usr/local/bin in path, 'X11/init' will launch
# /usr/local/bin/X11/init. commands beginning with '/', './' or '../'
# are not subject to the path search
setopt pathdirs
# do parameter expansion, command substitution and arithmetic expansion
# in prompts
setopt promptsubst
# don't push multiple copies of the same directory onto the directory
# stack
setopt pushdignoredups
# cd -<n> goes from the top of the pushd stack
# cd +<n> goes from the bottom of the pushd stack
setopt pushdminus
# do not print the directory stack after pushd or popd
setopt pushdsilent
# DEFAULT query the user before executing 'rm *' or 'rm path/*'
setopt normstarsilent


fpath=(~/.zsh/functions $fpath)

autoload -Uz ~/.zsh/functions/*(.:t)
