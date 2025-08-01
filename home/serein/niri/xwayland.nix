{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [ xwayland-satellite ];
    sessionVariables = {
      DISPLAY = ":0";
    };
  };
}
