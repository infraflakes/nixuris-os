{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nordzy-icon-theme
  ];
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "Nordzy";
    };
  };

	dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme  = "Nordic";
        icon-theme = "Nordzy";
        color-scheme = "prefer-dark";
      };
    };
  };
}
