{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    vesktop
    inputs.zen-browser.packages.x86_64-linux.twilight
  ];
}
