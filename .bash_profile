# showing current branch when in a git repository
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "


# fzf options
# requires github.com/junegunn/fzf and github.com/sharkdp/fd
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND="fd -H . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d -H . $HOME"


# bash_history
export HISTSIZE=50000                     # In memory history size
export HISTFILESIZE=50000                 # On disk history size
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend                       # Append to history instead of overwriting
HISTTIMEFORMAT="%Y-%m-%d %T "             # Add timestamp to history


# notes
NOTES_DIR="$HOME/notes"                                   # Directory to store notes
notes_filename() {
    echo $(date +"%Y-%m-%d").md
}
alias n="vim $NOTES_DIR/$(notes_filename)"   # Notes filenames are the date. ie `2018-04-07.md`
