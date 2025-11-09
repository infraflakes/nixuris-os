{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      labwc
      xwayland
      openbox
    ];
  };
}
