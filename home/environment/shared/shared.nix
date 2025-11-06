{
  config,
  pkgs,
  ...
}:
{
  imports = [

    # CLI
    ./cli/fish.nix
    ./cli/zsh.nix
    ./cli/kitty.nix

    ./scripts/scripts.nix

    ./sys/autostart.nix
    ./sys/env.nix
    ./sys/ime.nix
    ./sys/mako.nix
    ./sys/modify-desktop-entry.nix
    ./sys/rofi.nix
    ./sys/swaylock.nix
    ./sys/uwsm.nix
    ./sys/waybar.nix

    # Theme
    ./theme/cli/starship.nix
    ./theme/cli/fastfetch.nix
    ./theme/fonts.nix
    ./theme/gtk.nix
    ./theme/wallpapers.nix
  ];
}
