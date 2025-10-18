{
  config,
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "nixuris";
    homeDirectory = "/home/nixuris";
    stateVersion = "25.11";
    packages = [
      #inputs.serein-cli.packages.${pkgs.system}.stable
      inputs.serein-cli.packages.${pkgs.system}.test
      pkgs.lsd
    ];
  };
  imports = [
    ./pkgs/dev.nix
    ./pkgs/fonts.nix
    ./pkgs/media.nix
    ./pkgs/misc.nix
    ./pkgs/social.nix
    ./pkgs/vpn.nix
    #Other apps configs
    ./apps/ime.nix
    ./apps/gtk.nix
    ./apps/fish.nix
    ./apps/kitty.nix
    #./apps/alacritty.nix
    ./apps/fastfetch.nix
    ./apps/nvim.nix
    ./apps/yazi.nix
    ./apps/tmux.nix
    ./apps/container.nix
    #./apps/ollama.nix

    # WM
    ./serein/serein.nix
  ];
}
