{
  config,
  pkgs,
  ...
}: let
  ####################################################################
  # GTK Themes
  tokyonight = "Tokyonight-Dark";
  tokyonight-pkg = pkgs.tokyonight-gtk-theme;

  catppuccin = "catppuccin-frappe-blue-standard";
  catppuccin-pkg = pkgs.catppuccin-gtk;

  whitesur = "WhiteSur-Dark";
  whitesur-pkg = pkgs.whitesur-gtk-theme;
  ####################################################################
  # Icon Themes
  papirus = "Papirus-Dark";
  papirus-pkg = pkgs.papirus-icon-theme;

  whitesur-icon = "WhiteSur-dark";
  whitesur-icon-pkg = pkgs.whitesur-icon-theme;
  ####################################################################
  # Cursor Themes
  bibata = "Bibata-Modern-Ice";
  bibata-pkg = pkgs.bibata-cursors;

  whitesur-cursor = "WhiteSur Cursors";
  whitesur-cursor-pkg = pkgs.whitesur-cursors;
  ####################################################################
  # Icon
  iconname = whitesur-icon;
  pkgicon = whitesur-icon-pkg;

  # GTK
  themename = whitesur;
  pkgtheme = whitesur-pkg;

  # Cursor
  cursorname = whitesur-cursor;
  pkgcursor = whitesur-cursor-pkg;

  # Font
  fontname = "JetBrainsMono Nerd Font 12";
in {
  home.packages = with pkgs; [
    pkgicon
  ];
  home.sessionVariables = {
    GTK_THEME = themename;
    XCURSOR_THEME = "WhiteSur Cursors";
    XCURSOR_SIZE = 24;
  };
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgcursor;
      name = cursorname;
    };
    theme = {
      package = pkgtheme;
      name = themename;
    };
    iconTheme = {
      package = pkgicon;
      name = iconname;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = themename;
        icon-theme = iconname;
        color-scheme = "prefer-dark";
        font-name = fontname;
        document-font-name = fontname;
        monospace-font-name = fontname;
      };
    };
  };
}
