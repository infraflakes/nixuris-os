{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    vesktop
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight
  ];
}
