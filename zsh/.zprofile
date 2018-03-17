# XDG_CONFIG_HOME/zsh/.zprofile

export PATH=$HOME/local/bin:${PATH}

#XDG Compliance enforcing
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat

#Go fits well in a ~/local based set up
export GOPATH=$HOME/local

#Trying to get WLC
export XKB_DEFAULT_LAYOUT=dvorak
export XKB_DEFAULT_OPTION=compose:menu,caps:escape

# Less
export LESS=-RX
export PAGER=less
export LESSHISTFILE=$XDG_CACHE_HOME/less/history

# Editing
export EDITOR=edit
export VISUAL=edit
export SUDO_EDITOR=rvim

export TERMINAL=st

# Xorg stuffs
export XINITRC=$XDG_CONFIG_HOME/x11/xinitrc
export XAUTHORITY=$XDG_RUNTIME_DIR/x11/xauthority

source <(dircolors $XDG_CONFIG_HOME/terminal-colors.d/ls.enable)
source "$XDG_CONFIG_HOME"/session/config

# Browser
export WWW_HOME="https://duckduckgo.com"
