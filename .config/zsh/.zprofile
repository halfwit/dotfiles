# XDG_CONFIG_HOME/zsh/.zprofile

export PATH=$HOME/.local/bin:$HOME/.cabal/bin:${PATH}

# XDG file paths 
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

#XDG Compliance enforcing
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export GIMP2_DIRECTORY=$XDG_CONFIG_HOME/gimp
export ELINKS_CONFDIR=$XDG_CONFIG_HOME/elinks
export XCOMPOSEFILE=$XDG_CONFIG_HOME/x11/xcompose
export NOTMUCH_CONFIG=$XDG_CONFIG_HOME/notmuch/config
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat

#Trying to get WLC
export XKB_DEFAULT_LAYOUT=dvorak
export XKB_DEFAULT_OPTION=compose:caps
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

export BROWSER=jumanji
export TERMINAL=termite

# For nvim true colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# This is for the Nvidia .nv file that normally shows at $HOME
export __GL_SHADER_DISK_CACHE_PATH=$XDG_CACHE_HOME/nv

# Xorg stuffs
export GTK_IM_MODULE=xim
export XAUTHORITY=$XDG_RUNTIME_DIR/x11/xauthority

source <(dircolors $XDG_CONFIG_HOME/terminal-colors.d/ls.enable)

