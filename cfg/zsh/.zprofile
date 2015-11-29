# XDG_CONFIG_HOME/zsh/.zprofile

export PATH=$HOME/local/bin:${PATH}


#XDG Compliance enforcing
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export GIMP2_DIRECTORY=$XDG_CONFIG_HOME/gimp
export XCOMPOSEFILE=$XDG_CONFIG_HOME/x11/xcompose
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat

#Trying to get WLC
export XKB_DEFAULT_LAYOUT=dvorak
export XKB_DEFAULT_OPTION=compose:menu,caps:escape
export WLC_BG=0

#More verbosity with Wayland errors
export MESA_DEBUG=1
export EGL_LOG_LEVEL=debug
export LIBGL_DEBUG=verbose
export WLC_DEBUG=xwm

# Less
export LESS=-RX
export PAGER=less
export LESSHISTFILE=$XDG_CACHE_HOME/less/history

# Editing
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=rvim

export CCACHE_DIR="$XDG_CACHE_HOME"/ccache

# ASP
export ASPROOT=$XDG_CACHE_HOME/build/asp
export BROWSER=qutebrowser
export TERMINAL=termite

# This is for the Nvidia .nv file that normally shows at $HOME
export __GL_SHADER_DISK_CACHE_PATH=$XDG_CACHE_HOME/nv

# Xorg stuffs
export GTK_IM_MODULE=xim
export XAUTHORITY=$XDG_RUNTIME_DIR/x11/xauthority

source <(dircolors $XDG_CONFIG_HOME/terminal-colors.d/ls.enable)

