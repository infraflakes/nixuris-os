{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontconfig.enable = true;
}
