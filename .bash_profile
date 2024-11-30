#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#
# Environment Variables
#

# Path
export PATH="${PATH}:~/bin:/usr/local/texlive/2024/bin/x86_64-linux"
export MANPATH="${MANPATH}:/usr/local/texlive/2024/texmf-dist/doc/man"
export INFOPATH="${INFOPATH}:/usr/local/texlive/2024/texmf-dist/doc/info"

# Wayland
export QT_QPA_PLATFORM="wayland;xcb"
export _JAVA_AWT_WM_NONREPARENTING=1
export ANKI_WAYLAND=1

# Font Scaling
export QT_FONT_DPI=120
# gsettings set org.gnome.desktop.interface text-scaling-factor 1.25

# Editor
export EDITOR=nvim
export DIFFPROG="nvim -d"

# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

#
# Window Manager
#

[ "$(tty)" = "/dev/tty1" ] && exec sway
