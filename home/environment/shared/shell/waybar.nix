{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    playerctl
  ];
  programs.waybar = {
    enable = true;
  };
  home.file.".config/waybar".source = ./config/waybar;
}
