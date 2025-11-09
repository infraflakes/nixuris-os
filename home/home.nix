{
  config,
  pkgs,
  inputs,
  ...
}: {
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
      inputs.serein-cli.packages.${pkgs.stdenv.hostPlatform.system}.test
      pkgs.lsd
    ];
  };
  imports = [
    ./pkg/pkgs.nix
    ./environment/environment.nix
  ];
}
