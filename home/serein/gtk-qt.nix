{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    papirus-icon-theme
    qt6ct
  ];
  home.file.".config/qt6ct/qt6ct.conf".text = ''
    [Appearance]
    icon_theme=Papirus
  '';
  dconf.enable = true;
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-frappe-blue-standard";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
}
