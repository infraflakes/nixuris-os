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
    ./cli/starship.nix
    ./cli/fastfetch.nix

    ./scripts/scripts.nix

    ./sys/autostart.nix
    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
    ./sys/uwsm.nix

    ./shell/fonts.nix
    ./shell/gtk.nix
    ./shell/mako.nix
    ./shell/rofi.nix
    ./shell/swaylock.nix
    ./shell/wallpapers.nix
    ./shell/waybar.nix
  ];
}
