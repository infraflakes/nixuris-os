{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [ ];
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono Nerd Font";
      size = 13;
    };
    settings = {
      foreground = "#ffffff";
      background = "#000000";
      cursor = "#7f7f7f";
      cursor_text_color = "#000000";
      selection_foreground = "#000000";
      selection_background = "#b4d5ff";

      color0 = "#4f4f4f";
      color1 = "#fa6c5f";
      color2 = "#a8fe60";
      color3 = "#729ebb";
      color4 = "#8ab4f8";
      color5 = "#7aa2f7";
      color6 = "#7aa2f7";
      color7 = "#eeedee";

      color8 = "#7b7b7b";
      color9 = "#fcb6af";
      color10 = "#ceffab";
      color11 = "#fffecc";
      color12 = "#b5dcfe";
      color13 = "#fb9bfe";
      color14 = "#dfdffd";
      color15 = "#fefffe";
      shell = "${config.home.homeDirectory}/.nix-profile/bin/fish";
      hide_window_decorations = "yes";
      confirm_os_window_close = 0;
      window_padding_width = 15;
      enable_audio_bell = "no";
      input_delay = 0;
      repaint_delay = 0;
      sync_to_monitor = "no";
    };
    shellIntegration.enableFishIntegration = true;
    shellIntegration.enableZshIntegration = true;
  };
}
