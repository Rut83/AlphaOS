# AlphaOS interactive shell
case $- in
    *i*)
        if command -v fastfetch >/dev/null 2>&1; then
            fastfetch
        fi
        ;;
esac
