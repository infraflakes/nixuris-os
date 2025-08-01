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
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
  imports = [
    ./pkgs/pkgs.nix

    #Other apps configs
    ./confs/ime.nix
    ./confs/dev.nix
    ./confs/kitty.nix
    ./confs/fish.nix
    ./confs/fastfetch.nix
    ./confs/nvim.nix
    ./confs/ranger.nix

    #Serein Hyprland Dots
    ./serein/serein.nix
  ];
}
