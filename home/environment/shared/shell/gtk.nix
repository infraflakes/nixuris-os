{
  config,
  pkgs,
  ...
}: let
  # Themes
  tokyonight = "Tokyonight-Dark";
  tokyonight-pkg = pkgs.tokyonight-gtk-theme;

  catppuccin = "catppuccin-frappe-blue-standard";
  catppuccin-pkg = pkgs.catppuccin-gtk;

  # Icon Theme
  iconname = "Papirus-Dark";
  pkgicon = pkgs.papirus-icon-theme;

  # GTK Theme
  themename = catppuccin;
  pkgtheme = catppuccin-pkg;

  # Cursor
  cursorname = "Bibata-Modern-Ice";
  pkgcursor = pkgs.bibata-cursors;

  # Font
  fontname = "JetBrainsMono Nerd Font 12";
in {
  home.packages = with pkgs; [
    pkgicon
  ];
  home.sessionVariables.GTK_THEME = themename;
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
