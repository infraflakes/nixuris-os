{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [ ];
  programs.kitty = {
    enable = true;
    font = {
    	name = "JetBrains Mono Nerd Font";
	size = 13;
    };
    settings = {
    foreground            = "#bfd4e1";
    background            = "#1b1e25";
    cursor                = "#7f7f7f";
    cursor_text_color     = "#000000";
    selection_foreground  = "#000000";
    selection_background  = "#b4d5ff";

    color0  = "#333232";
    color1  = "#bf616a";
    color2  = "#88c0d0";
    color3  = "#5e81ac";
    color4  = "#86afef";
    color5  = "#5e81ac";
    color6  = "#81a1c1";
    color7  = "#eeedee";

    color8  = "#696969";
    color9  = "#5e81ac";
    color10 = "#88c0d0";
    color11 = "#81a1c1";
    color12 = "#b5dcfe";
    color13 = "#86afef";
    color14 = "#88c0d0";
    color15 = "#fefffe";
        shell = "fish";
	hide_window_decorations = "yes"; 
confirm_os_window_close = 0;
window_padding_width = 15;
window_padding_height = 15;
enable_audio_bell = "no";
input_delay = 0;
repaint_delay = 2;
sync_to_monitor = "no";
      };
        shellIntegration.enableFishIntegration = true;
  };
}
