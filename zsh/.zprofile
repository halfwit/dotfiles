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

# Browser
export WWW_HOME="https://duckduckgo.com"
export RTV_BROWSER=/usr/local/bin/plumber
export BROWSER="/usr/local/bin/plumber"

# Plan9
export NAMESPACE=/tmp/ns.halfwit.:1
export PATH=${PATH}:/usr/lib/plan9/bin
export PLAN9=/usr/lib/plan9
