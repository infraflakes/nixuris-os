{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [ xwayland-satellite openbox ];
    sessionVariables = {
      DISPLAY = ":0";
    };
  };
}
