{
  config,
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "infraflakes";
    homeDirectory = "/home/infraflakes";
    stateVersion = "25.11";
    sessionVariables = {
      EDITOR = "nvim";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
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
    ./apps/bash.nix
    ./apps/zsh.nix
    ./apps/fish.nix
    ./apps/starship.nix
    ./apps/kitty.nix
    ./apps/fastfetch.nix
    ./apps/nvim.nix
    ./apps/yazi.nix
    ./apps/tmux.nix
    ./apps/podman.nix
    #./apps/ollama.nix

    # WM
    ./serein/serein.nix

    # Executables
    ./execs/execs.nix
  ];
}
