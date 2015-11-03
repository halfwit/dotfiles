# XDG_CONFIG_HOME/zsh/.zshrc


# Modules.
autoload -Uz edit-command-line run-help compinit zmv colors 
zmodload zsh/complist
compinit

# Vimode functions
zle -N edit-command-line
zle -N zle-line-init
# Every time keymap is switched, this is invoked (for vicmd)
zle -N zle-keymap-select

# Shell Options
setopt auto_cd \
    dot_glob \
    hist_verify \
    hist_append \
    prompt_subst \
    extended_glob \
    rm_star_silent \
    hist_fcntl_lock \
    print_exit_value \
    complete_aliases \
    numeric_glob_sort \
    hist_save_no_dups \
    hist_ignore_space \
    hist_ignore_space \
    hist_reduce_blanks \
    hist_ignore_all_dups \
    interactive_comments

READNULLCMD=$PAGER
HELPDIR=/usr/share/zsh/$ZSH_VERSION/help
HISTFILE=$XDG_CONFIG_HOME/zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Style.
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' rehash yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

PROMPT='[%T%F{blue}] [%f%m%F{blue}] [%f%F{magenta}%~%f%F{blue}]%f %F{green}${branch}%f
%F{black}[%F{blue}%n%f%F{black}(${vimode})]%f '

# Functions.
# All I want is the git branch for now, vcs_info is way overkill to do this.
function get_git_branch {
    if [[ -d .git ]]; then
        read -r branch < .git/HEAD
        branch=" ${branch##*/} "
    else
        branch=" "
    fi
}

# Print basic prompt to the window title.
function precmd {
    print -Pn "\e];%n %~\a"
    get_git_branch
}

# Print the current running command's name to the window title.
function preexec {
    if [[ $TERM == xterm-* ]]; then
        local cmd=${1[(wr)^(*=*|sudo|exec|ssh|-*)]}
        print -Pn "\e];$cmd:q\a"
    fi
}

# Replace vimode indicators.
function zle-line-init zle-keymap-select {
    vimode=${${KEYMAP/vicmd/c}/(main|viins)/i}
    zle reset-prompt
}

# Simple widget for quoting the current word or the previous if cursor
# positioned on a blank.
function quote-word {
    zle vi-forward-word
    zle vi-backward-blank-word
    zle set-mark-command
    zle vi-forward-blank-word-end
    zle quote-region
}
zle -N quote-word

# Keybinds, use vimode explicitly.
bindkey -v

# Initialise vimode to insert mode.
vimode=i

# Remove the default 0.4s ESC delay, set it to 0.1s.
export KEYTIMEOUT=1

# Shift-tab.
bindkey $terminfo[kcbt] reverse-menu-complete

# Delete.
bindkey -M vicmd $terminfo[kdch1] vi-delete-char
# Insert.
bindkey -M vicmd $terminfo[kich1] vi-insert

# Home.
bindkey -M vicmd $terminfo[khome] vi-beginning-of-line

# End.
bindkey -M vicmd $terminfo[kend] vi-end-of-line

# Backspace (and <C-h>).
bindkey -M vicmd $terminfo[kbs] backward-char

# Page up (and <C-b> in vicmd).
bindkey -M vicmd $terminfo[kpp] beginning-of-buffer-or-history

# Page down (and <C-f> in vicmd).
bindkey -M vicmd $terminfo[knp] end-of-buffer-or-history

bindkey -M vicmd '^B' beginning-of-buffer-or-history

# Do history expansion on space.
bindkey ' ' magic-space

# Use M-w for small words.
bindkey '^[w' backward-kill-word
bindkey '^W' vi-backward-kill-word

bindkey -M vicmd '^H' backward-char

# h and l whichwrap.
bindkey -M vicmd 'h' backward-char
bindkey -M vicmd 'l' forward-char

# Incremental undo and redo.
bindkey -M vicmd '^R' redo
bindkey -M vicmd 'u' undo

# Misc.
bindkey -M vicmd 'ga' what-cursor-position

# Open in editor.
bindkey -M vicmd 'v' edit-command-line

# History search.
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

# Patterned history search with zsh expansion, globbing, etc.
bindkey -M vicmd '^T' history-incremental-pattern-search-backward

# Verify search result before accepting.
bindkey -M isearch '^M' accept-search

# Quote the current or previous word.
bindkey -M vicmd 'Q' quote-word

# Colored manpages 
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Aliases


alias -g ...='../..'
alias -g ....='../../..'
alias rr='rm -rvI'
alias rm='rm -vI'
alias cp='cp -vi'
alias mv='mv -vi'
alias ln='ln -vi'
alias mkdir='mkdir -vp'
alias grep='grep --color=auto'


alias e='emacsclient -nw'
alias v='vim'
alias chmod='chmod -c --preserve-root'
alias chown='chown -c --preserve-root'
alias chgrp='chgrp -c --preserve-root'

alias ls='ls --color=auto --group-directories-first -AhXF'
alias ll='ls --color=auto --group-directories-first -AlhXF'

alias dmesg=dmesg -exL

alias gdb="gdb -n -x $XDG_CONFIG_HOME/gdb/init"
alias ncmpcpp="ncmpcpp -c $XDG_CONFIG_HOME/ncmpcpp/ncmpcpp.conf"
alias aria2c="aria2c --dht-file-path $XDG_CACHE_HOME/aria2/dht.dat"

alias k='rlwrap k'

alias i="curl -F 'f:1=<-' ix.io"
alias s="curl -F 'sprunge=<-' sprunge.us"
alias p="curl -F 'c=@-' https://ptpb.pw"
alias pb='pbpst -S'
alias xc='xclip -o | i' 
alias spaced="sed 's:\(.\):\1 :g'"
# Directory hashes.
if [[ -d $HOME/dev ]]; then
    for d in $HOME/dev/*(/); do
        hash -d ${d##*/}=$d
    done
fi

alias sysupdate="sudo snp pacman -Syu"

# Enable C-S-t in (vte) termite which opens a new terminal in the same working
# directory.
if [[ -n $VTE_VERSION ]]; then
    source /etc/profile.d/vte.sh
    __vte_prompt_command
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
