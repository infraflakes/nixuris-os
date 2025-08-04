{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "nixuris";
    homeDirectory = "/home/nixuris";
    stateVersion = "25.11";
  };
  imports = [
    ./pkgs/pkgs.nix
    ./pkgs/hide-desktop-entry.nix
    ./pkgs/ime.nix
    ./pkgs/dev.nix
    ./pkgs/fonts.nix
    ./pkgs/media.nix
    ./pkgs/social.nix
    ./pkgs/misc.nix
    #Other apps configs
    ./confs/kitty.nix
    ./confs/fish.nix
    ./confs/fastfetch.nix
    ./confs/nvim.nix
    ./confs/ranger.nix

    #Serein Dots
    ./serein/serein.nix
  ];
}
