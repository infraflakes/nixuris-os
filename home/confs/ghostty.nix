{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.ghostty = {
    enable = true;
    settings = {
      keybind = [
        "ctrl+t=new_tab"
        "ctrl+a=toggle_tab_overview"
        "ctrl+q=close_tab"
        "ctrl+right=next_tab"
        "ctrl+left=previous_tab"
      ];
      font-family = "JetBrains Mono Nerd Font";
      font-size = 13;
      theme = "catppuccin-frappe";
      background = "1b1e25";
    };
    enableFishIntegration = true;
  };
}
