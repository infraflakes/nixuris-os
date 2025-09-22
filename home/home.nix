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
    packages = [
      #inputs.serein-cli.packages.${pkgs.system}.stable
      inputs.serein-cli.packages.${pkgs.system}.test
    ];
  };
  imports = [
    ./pkgs/hide-desktop-entry.nix
    ./pkgs/autostart.nix
    ./pkgs/ime.nix
    ./pkgs/dev.nix
    ./pkgs/fonts.nix
    ./pkgs/media.nix
    ./pkgs/social.nix
    ./pkgs/vpn.nix
    #./pkgs/llm.nix
    ./pkgs/misc.nix
    #Other apps configs
    ./confs/gtk.nix
    ./confs/ghostty.nix
    ./confs/fish.nix
    ./confs/fastfetch.nix
    ./confs/nvim.nix
    ./confs/yazi.nix

    #Serein Dots
    #./serein/serein.nix
  ];
}
