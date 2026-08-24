#!/bin/sh
set -eu

TARGET="${ROOT:-/target}"

# ============================================================
# AlphaOS installed-system branding
# ============================================================

WALLPAPER="$TARGET/usr/share/backgrounds/alphaos/alphaos-wallpaper.png"
LOGO="$TARGET/usr/share/alphaos/branding/logo.png"

# Ensure branding assets have sane permissions.
[ -f "$WALLPAPER" ] && chmod 0644 "$WALLPAPER" || true
[ -f "$LOGO" ] && chmod 0644 "$LOGO" || true

# ------------------------------------------------------------
# Find the normal user created by Calamares.
# ------------------------------------------------------------

USER_NAME=""

if [ -f "$TARGET/etc/passwd" ]; then
    while IFS=: read -r name _ uid _ _ home shell; do
        case "$uid" in
            1000|1001|1002|1003|1004|1005|1006|1007|1008|1009)
                case "$home" in
                    /home/*)
                        USER_NAME="$name"
                        break
                        ;;
                esac
                ;;
        esac
    done < "$TARGET/etc/passwd"
fi

# ------------------------------------------------------------
# Install AlphaOS avatar for the installed user.
# ------------------------------------------------------------

if [ -n "$USER_NAME" ] && [ -f "$LOGO" ]; then
    USER_HOME="$TARGET/home/$USER_NAME"

    if [ -d "$USER_HOME" ]; then
        install -m 0644 "$LOGO" "$USER_HOME/.face"
        install -m 0644 "$LOGO" "$USER_HOME/.face.icon"

        chown "$USER_NAME:$USER_NAME" \
            "$USER_HOME/.face" \
            "$USER_HOME/.face.icon"
    fi
fi

# ------------------------------------------------------------
# Make AlphaOS wallpaper available through the desktop-base
# default wallpaper path when desktop-base is installed.
# ------------------------------------------------------------

DESKTOP_BASE="$TARGET/usr/share/images/desktop-base"

if [ -d "$DESKTOP_BASE" ]; then
    rm -f "$DESKTOP_BASE/alphaos-background"

    ln -sf \
        /usr/share/backgrounds/alphaos/alphaos-wallpaper.png \
        "$DESKTOP_BASE/alphaos-background"

    # If desktop-background is a symlink, replace the alternative
    # target rather than destroying desktop-base itself.
    if [ -L "$DESKTOP_BASE/desktop-background" ]; then
        rm -f "$DESKTOP_BASE/desktop-background"
        ln -sf alphaos-background "$DESKTOP_BASE/desktop-background"
    fi
fi

exit 0
