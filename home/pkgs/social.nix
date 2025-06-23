{
  config,
  pkgs,
  inputs,
  zen-browser,
  ...
}: {
  home.packages = with pkgs; [
    telegram-desktop
    vesktop
    inputs.zen-browser.packages.x86_64-linux.twilight
  ];
}
