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
    ./sys/modify-desktop-entry.nix
    ./sys/uwsm.nix

    ./theme/theme.nix
  ];
}
