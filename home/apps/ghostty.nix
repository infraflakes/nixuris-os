{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.ghostty = {
    enable = true;
    settings = {
      # keybind = [
      #   "alt+n=new_tab"
      #   "alt+a=toggle_tab_overview"
      #   "alt+q=close_tab"
      #   "alt+right=next_tab"
      #   "alt+left=previous_tab"
      # ];
      font-family = "JetBrains Mono Nerd Font";
      font-size = 13;
      theme = "Catppuccin Frappe";
      background = "1b1e25";
    };
    enableFishIntegration = true;
  };
}
