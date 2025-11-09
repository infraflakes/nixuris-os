{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    grim
    slurp
    swappy
  ];
  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir=$HOME/Pictures/Screenshots
    save_filename_format=swappy-%Y%m%d-%H%M%S.png
  '';
}
