{
  config,
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "nixuris";
    homeDirectory = "/home/nixuris";
    stateVersion = "25.11";
    packages = [inputs.serein-cli.packages.${pkgs.system}.default];
  };
  imports = [
    ./pkgs/hide-desktop-entry.nix
    ./pkgs/ime.nix
    ./pkgs/dev.nix
    ./pkgs/fonts.nix
    ./pkgs/media.nix
    ./pkgs/social.nix
    #./pkgs/llm.nix
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
