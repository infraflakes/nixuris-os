{
  config,
  pkgs,
  ...
}: {
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

    ./shell/dms.nix
    ./shell/fonts.nix
    ./shell/theme.nix
    ./shell/wallpapers.nix
  ];
}
