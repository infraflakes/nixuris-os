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
      XDG_CONFIG_HOME = "$HOME/.config";
      NIXOS_OZONE_WL = "1";
    };
  };
  imports = [
    ./pkgs.nix

    #Other apps configs
    ./confs/ime.nix
    ./confs/dev.nix
    ./confs/alacritty.nix
    ./confs/foot.nix
    ./confs/fastfetch.nix
    ./confs/nvim.nix
    ./confs/ranger.nix

    #Serein Hyprland Dots
    ./serein/serein.nix
  ];
}
