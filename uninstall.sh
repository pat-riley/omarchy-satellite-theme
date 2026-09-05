#!/bin/bash
# Remove the live wallpaper refresher. Pass --purge to also delete the theme and config.
set -uo pipefail
systemctl --user disable --now omarchy-satellite-bg.timer 2>/dev/null
rm -f "$HOME/.config/systemd/user/omarchy-satellite-bg.service" "$HOME/.config/systemd/user/omarchy-satellite-bg.timer"
systemctl --user daemon-reload
rm -f "$HOME/.local/bin/omarchy-satellite-bg" "$HOME/.local/bin/omarchy-satellite-palette"
rm -f "$HOME/.config/omarchy/hooks/theme-set.d/satellite-bg-hook"
rm -rf "$HOME/.config/omarchy/backgrounds/satellite" "$HOME/.cache/omarchy-satellite" "${XDG_RUNTIME_DIR:-/tmp}/omarchy-satellite"
if [[ ${1:-} == --purge ]]; then
  rm -rf "$HOME/.config/omarchy/themes/satellite" "$HOME/.config/omarchy/satellite-bg.conf"
fi
if [[ $(cat "$HOME/.local/state/omarchy/current/theme.name" 2>/dev/null) == satellite ]]; then
  echo "The satellite theme is still active; switch themes with: omarchy theme set <name>"
fi
echo "Removed."
