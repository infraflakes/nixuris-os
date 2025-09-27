{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    papirus-icon-theme
  ];
  home.sessionVariables.GTK_THEME = "Tokyonight-Dark";
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "Tokyonight-Dark";
        icon-theme = "Papirus-Dark";
        color-scheme = "prefer-dark";
        font-name = "JetBrainsMono Nerd Font 12";
        document-font-name = "JetBrainsMono Nerd Font 12";
        monospace-font-name = "JetBrainsMono Nerd Font 12";
      };
    };
  };
}
