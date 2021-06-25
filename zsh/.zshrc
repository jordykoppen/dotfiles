for file in $DOTFILES/**/alias.zsh; source $file 

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000000
export SAVEHIST=10000000

setopt BANG_HIST                   # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY            # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY          # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY               # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST      # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS            # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS        # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS           # Do not display a line previously found.
setopt HIST_IGNORE_SPACE           # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS           # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS          # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY                 # Don't execute immediately upon history expansion.
setopt HIST_BEEP                   # Beep when accessing nonexistent history.
setopt MENU_COMPLETE               # select first menu option automatically
setopt NO_NOMATCH                  # stop zsh from catching ^ chars.
setopt INTERACTIVE_COMMENTS        # allow comments in interactive shells

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi


source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 blockf \
    zsh-users/zsh-completions

# GitHub Plugins
zinit ice wait'!'
zinit light zsh-users/zsh-history-substring-search
zinit light agkozak/zsh-z

zinit ice from"gh-r" as"program" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# Enter command mode with jj
bindkey 'jj' vi-cmd-mode

exit_zsh() { exit }
zle -N exit_zsh
bindkey 'qq' exit_zsh

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
