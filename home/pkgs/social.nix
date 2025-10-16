{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    vesktop
    google-chrome
    inputs.zen-browser.packages.x86_64-linux.twilight
  ];
}
