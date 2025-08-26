{
  config,
  pkgs,
  libs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    htop
    ncdu
    tmux
    btop
    inputs.serein-cli.packages.${pkgs.system}.default
  ];
 }
