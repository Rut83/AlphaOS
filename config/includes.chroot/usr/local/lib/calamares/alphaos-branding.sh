#!/bin/sh
set -eu

TARGET="${ROOT:-/target}"

WALLPAPER="$TARGET/usr/share/backgrounds/alphaos/alphaos-wallpaper.png"
LOGO="$TARGET/usr/share/pixmaps/alphaos-user-logo.png"

# Apply AlphaOS logo to the user created by Calamares.
if [ -n "${USERNAME:-}" ] && [ -d "$TARGET/home/$USERNAME" ]; then
    cp "$LOGO" "$TARGET/home/$USERNAME/.face"
    cp "$LOGO" "$TARGET/home/$USERNAME/.face.icon"

    chown "$USERNAME:$USERNAME" \
        "$TARGET/home/$USERNAME/.face" \
        "$TARGET/home/$USERNAME/.face.icon"
fi

# Keep AlphaOS wallpaper available system-wide.
[ -f "$WALLPAPER" ] || exit 0

exit 0
