{
  config,
  pkgs,
  ...
}:
{
  imports = [

    # Theme

    ./cli/starship.nix
    ./cli/fastfetch.nix

    ./shell/fonts.nix
    ./shell/gtk.nix
    ./shell/wallpapers.nix
    ./shell/mako.nix
    ./shell/rofi.nix
    ./shell/swaylock.nix
    ./shell/waybar.nix
  ];
}
