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

#
# sway
#

[ "$(tty)" = "/dev/tty1" ] && exec sway
