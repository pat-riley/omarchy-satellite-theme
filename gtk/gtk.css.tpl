/* GTK4 / libadwaita and GTK3 colors rendered from the current Omarchy theme.
   Imported by ~/.config/gtk-4.0/gtk.css and ~/.config/gtk-3.0/gtk.css. */

:root {
  --accent-bg-color: {{ accent }};
  --accent-fg-color: {{ background }};
  --accent-color: {{ accent }};

  --window-bg-color: {{ background }};
  --window-fg-color: {{ foreground }};
  --view-bg-color: {{ dark_background }};
  --view-fg-color: {{ foreground }};

  --headerbar-bg-color: {{ background }};
  --headerbar-fg-color: {{ foreground }};
  --headerbar-border-color: rgba({{ muted_rgb }}, 0.5);
  --headerbar-backdrop-color: {{ dark_background }};
  --headerbar-shade-color: rgba(0, 0, 0, 0.36);
  --headerbar-darker-shade-color: rgba(0, 0, 0, 0.9);

  --sidebar-bg-color: {{ dark_background }};
  --sidebar-fg-color: {{ foreground }};
  --sidebar-backdrop-color: {{ darker_background }};
  --sidebar-border-color: rgba({{ muted_rgb }}, 0.5);
  --sidebar-shade-color: rgba(0, 0, 0, 0.25);
  --secondary-sidebar-bg-color: {{ darker_background }};
  --secondary-sidebar-fg-color: {{ foreground }};
  --secondary-sidebar-backdrop-color: {{ darker_background }};
  --secondary-sidebar-border-color: rgba({{ muted_rgb }}, 0.5);
  --secondary-sidebar-shade-color: rgba(0, 0, 0, 0.25);

  --card-bg-color: {{ lighter_background }};
  --card-fg-color: {{ foreground }};
  --card-shade-color: rgba(0, 0, 0, 0.36);
  --dialog-bg-color: {{ lighter_background }};
  --dialog-fg-color: {{ foreground }};
  --popover-bg-color: {{ lighter_background }};
  --popover-fg-color: {{ foreground }};
  --popover-shade-color: rgba(0, 0, 0, 0.25);
  --thumbnail-bg-color: {{ lighter_background }};
  --thumbnail-fg-color: {{ foreground }};

  --shade-color: rgba(0, 0, 0, 0.36);
  --scrollbar-outline-color: rgba({{ background_rgb }}, 0.5);

  --destructive-bg-color: {{ red }};
  --destructive-fg-color: {{ background }};
  --destructive-color: {{ bright_red }};
  --success-bg-color: {{ green }};
  --success-fg-color: {{ background }};
  --success-color: {{ bright_green }};
  --warning-bg-color: {{ yellow }};
  --warning-fg-color: {{ background }};
  --warning-color: {{ bright_yellow }};
  --error-bg-color: {{ red }};
  --error-fg-color: {{ background }};
  --error-color: {{ bright_red }};
}

/* GTK3 apps and older libadwaita read these names instead. */
@define-color accent_bg_color {{ accent }};
@define-color accent_fg_color {{ background }};
@define-color accent_color {{ accent }};
@define-color window_bg_color {{ background }};
@define-color window_fg_color {{ foreground }};
@define-color view_bg_color {{ dark_background }};
@define-color view_fg_color {{ foreground }};
@define-color headerbar_bg_color {{ background }};
@define-color headerbar_fg_color {{ foreground }};
@define-color headerbar_backdrop_color {{ dark_background }};
@define-color sidebar_bg_color {{ dark_background }};
@define-color sidebar_fg_color {{ foreground }};
@define-color sidebar_backdrop_color {{ darker_background }};
@define-color card_bg_color {{ lighter_background }};
@define-color card_fg_color {{ foreground }};
@define-color dialog_bg_color {{ lighter_background }};
@define-color dialog_fg_color {{ foreground }};
@define-color popover_bg_color {{ lighter_background }};
@define-color popover_fg_color {{ foreground }};
@define-color theme_bg_color {{ background }};
@define-color theme_fg_color {{ foreground }};
@define-color theme_base_color {{ dark_background }};
@define-color theme_text_color {{ foreground }};
@define-color theme_selected_bg_color {{ accent }};
@define-color theme_selected_fg_color {{ background }};
@define-color borders rgba({{ muted_rgb }}, 0.5);
