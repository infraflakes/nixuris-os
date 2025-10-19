{
  config,
  pkgs,
  ...
}:
{
  home.file.".local/bin/hypr" = {
    source = ./hypr;
    executable = true;
  };
  home.file.".local/bin/music" = {
    source = ./music;
    executable = true;
  };
  home.file.".local/bin/rofi" = {
    source = ./rofi;
    executable = true;
  };
}
