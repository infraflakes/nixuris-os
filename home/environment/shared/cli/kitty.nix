{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [];
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono Nerd Font";
      size = 13;
    };
    settings = {
      shell = "${config.home.homeDirectory}/.nix-profile/bin/fish";
      hide_window_decorations = "yes";
      confirm_os_window_close = 0;
      window_padding_width = 15;
      enable_audio_bell = "no";
      input_delay = 0;
      repaint_delay = 0;
      sync_to_monitor = "no";
    };
    extraConfig = ''
      include ${./config/kitty/evergarden-winter.conf}
    '';
    shellIntegration.enableFishIntegration = true;
    shellIntegration.enableZshIntegration = true;
  };
}
