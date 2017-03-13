# XDG_CONFIG_HOME/zsh/.zshrc

# Modules.
autoload -Uz edit-command-line run-help compinit zmv
zmodload zsh/complist
compinit

# Vimode functions
zle -N edit-command-line
zle -N zle-line-init

# Every time keymap is switched, this is invoked (for vicmd)
zle -N zle-keymap-select

# Shell Options
setopt auto_cd \
    correct              \
    dot_glob             \
    hist_verify          \
	appendhistory		 \
    prompt_subst         \
    extended_glob        \
    rm_star_silent       \
    hist_fcntl_lock      \
    complete_aliases     \
    print_exit_value     \
    numeric_glob_sort    \
    hist_save_no_dups    \
    hist_ignore_space    \
    hist_reduce_blanks   \
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

get_git_status() {
	test=$(git rev-parse --is-inside-work-tree 2> /dev/null)
	[[ ${#test} -gt 0 ]] || return 0
	case "$(git status | sed -n 2p)" in
		*ahead*)  print "🠙" ;;
		*behind*) print "🠛" ;;
		*diverg*) print "⥮" ;;
	esac
}

shorten_prompt() {
  local result
  local -a split    # the array we loop over
  split=(${(s:/:)${(Q)${(D)1:-$PWD}}})

  if [[ $split == "" ]]; then
    print /
    return 0
  fi

  if [[ $split[1] == \~ ]]; then
    result="\~"
    shift split
  fi

  if [[ ${#split} > 3 ]]; then
    result+="/${split[1]}/../${split[-2]}/${split[-1]}"
    print $result
    return 0
  fi

  for i in ${split[@]}; do
    result+="/$i"
  done
  
  print $result
  return 0
}

PROMPT='%F{${vimode}}%B%m%b%f $(shorten_prompt)%F{green} ${repo}$(get_git_status)%f
 %F{cyan}‣%f '

# Functions.

function to_bottom {
  print -Pn "\e[100B"
}
to_bottom

function preexec {
  if [[ $TERM == st* || $TERM == xterm-* ]]; then
    local cmd=${1[(wr)^(*=*|sudo|exec|ssh|-*)]}
    print -Pn "\e];$cmd:q\a"
    print -Pn "\e]2A"
    lng="$(( $(( ${#1} + 3 )) / $(tput cols) ))"
    repeat "$lng" print -Pn "\e[1A\e[F\e[K"
    repeat "$lng" print -Pn "\e[1B"
    print -Pn "\e]2B"
    print -Pn "\e[2A\e[K\e[34;0m • $1\e[2B\e[F\e[K\e[0;m"
  fi
}

function pb() {
	while read -r input; do
		printf '%s\n' "$input"
		tmp="$tmp
$input"
	done
	printf '%s\n%s\n' "$ ${history[$HISTCMD]/| pb/}" "$tmp" | curl -F c=@- "https://ptpb.pw/?u=1"
}

# Print basic prompt to the window title.
function precmd {
    print -Pn "\e];%n %~\a"
    repo=${(%):-%(?.${"$(git rev-parse --show-toplevel 2> /dev/null)"##*/} .)}
}

# Replace vimode indicators.
function zle-line-init zle-keymap-select {
    vimode=${${KEYMAP/vicmd/gray}/(main|viins)/blue}
    zle reset-prompt
}

function ft-zshexit {
    [[ -o hist_ignore_space ]] && BUFFER=' '
    BUFFER="${BUFFER}exit"
    zle .accept-line
}
zle -N q ft-zshexit

# Keybinds, use vimode explicitly.
bindkey -v

# Initialise vimode to insert mode.
vimode=i

# Remove the default 0.4s ESC delay, set it to 0.1s.
export KEYTIMEOUT=1

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

# Do history expansion on space.
bindkey ' ' magic-space

bindkey -M vicmd '^H' backward-char

# h and l whichwrap.
bindkey -M vicmd 'h' backward-char
bindkey -M vicmd 'l' forward-char

# History search.
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

# Patterned history search with zsh expansion, globbing, etc.
bindkey -M vicmd '^T' history-incremental-pattern-search-backward

# Colored manpages
man() {
   local width=$(tput cols) 
   [ $width -gt $MANWIDTH ] && width=$MANWIDTH
   env MANWIDTH=$width \
   LESS_TERMCAP_mb=$'\E[01;31m' \
   LESS_TERMCAP_md=$'\E[01;38;5;74m' \
   LESS_TERMCAP_me=$'\E[0m' \
   LESS_TERMCAP_se=$'\E[0m' \
   LESS_TERMCAP_so=$'\E[38;5;246m' \
   LESS_TERMCAP_ue=$'\E[0m' \
   LESS_TERMCAP_us=$'\E[04;38;5;146m' \
   man "$@"
}

# Aliases
#alias :q='exit'
alias rr='rm -rvI'
alias rm='rm -vI'
alias cp='cp -vi'
alias mv='mv -vi'
alias ln='ln -vi'
alias mkdir='mkdir -vp'
alias grep='grep --color=auto'

alias chmod='chmod -c --preserve-root'
alias chown='chown -c --preserve-root'
alias chgrp='chgrp -c --preserve-root'
 
alias ls='ls --color=auto --group-directories-first -AhXF'
alias ll='ls --color=auto --group-directories-first -AlhXF'
