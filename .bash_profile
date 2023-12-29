#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#
# Environment Variables
#

# Personal scripts and tex
export PATH="${PATH}:~/bin:/usr/local/texlive/2023/bin/x86_64-linux"
export MANPATH="${MANPATH}:/usr/local/texlive/2023/texmf-dist/doc/man"
export INFOPATH="${INFOPATH}:/usr/local/texlive/2023/texmf-dist/doc/info"

# Wayland variables
export QT_QPA_PLATFORM=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# Editor
export EDITOR=nvim
export DIFFPROG="nvim -d"

# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_CACHE_HOME=~/.cache

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java"

#
# sway
#

[ "$(tty)" = "/dev/tty1" ] && exec sway
