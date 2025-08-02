{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [ xwayland-satellite xwayland openbox ];
    sessionVariables = {
      DISPLAY = ":0";
    };
  };
}
