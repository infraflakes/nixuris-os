{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrains Mono Nerd Font";
      font-size = 13;
      theme = "catppuccin-frappe";
      background = "1b1e25";
    };
    enableFishIntegration = true;
  };
}
