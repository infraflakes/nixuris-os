{
  config,
  pkgs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      labwc
      xwayland
      openbox
    ];
    sessionVariables = {
      #DISPLAY = ":0";
    };
  };
}
