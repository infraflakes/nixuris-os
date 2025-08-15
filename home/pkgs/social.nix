{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    telegram-desktop
    vesktop
    inputs.zen-browser.packages.x86_64-linux.twilight
  ];
}
