{
  config,
  pkgs,
  inputs,
  zen-browser,
  ...
}: {
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
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./pkgs.nix

    #Other apps configs
    ./confs/ime.nix
    ./confs/vscode.nix
    ./confs/alacritty.nix
    ./confs/foot.nix
    ./confs/fastfetch.nix
    ./confs/nvim.nix
    ./confs/ranger.nix
    ./confs/swappy.nix

    #Serein config
    ./serein/gtk.nix
    ./serein/hypr.nix
    ./serein/swaylock.nix
    ./serein/rofi.nix
    ./serein/swaync.nix
    ./serein/waybar.nix
    ./serein/fish.nix
  ];
}
