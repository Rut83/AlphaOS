# AlphaOS shell
[ -r /etc/bash.bashrc ] && . /etc/bash.bashrc
case $- in *i*) command -v fastfetch >/dev/null 2>&1 && fastfetch ;; esac
