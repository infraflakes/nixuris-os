{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    yazi
    zip
    unzip
    p7zip
    unrar
  ];
}
