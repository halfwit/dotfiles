# XDG_CONFIG_HOME/zsh/.zprofile

export PATH=$HOME/local/bin:${PATH}
export FT2_SUBPIXEL_HINTING=1

#XDG Compliance enforcing
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export XCOMPOSEFILE=$XDG_CONFIG_HOME/x11/xcompose
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat
export GOPATH=$HOME/local

#Trying to get WLC
export XKB_DEFAULT_LAYOUT=dvorak
export XKB_DEFAULT_OPTION=compose:menu,caps:escape

# Less
export LESS=-RX
export PAGER=less
export LESSHISTFILE=$XDG_CACHE_HOME/less/history

# Editing
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=rvim

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# ASP
export TERMINAL=st

# Xorg stuffs
export XINITRC=$XDG_CONFIG_HOME/x11/xinitrc
export GTK_IM_MODULE=xim
export XAUTHORITY=$XDG_RUNTIME_DIR/x11/xauthority

source <(dircolors $XDG_CONFIG_HOME/terminal-colors.d/ls.enable)

export VIS_THEME="dark-16"
source "$XDG_CONFIG_HOME"/session/config
