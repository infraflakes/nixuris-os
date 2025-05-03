{ config, pkgs, ... }:
{
  programs.ranger = {
    enable = true;
    settings = {
      preview_images_method = "ueberzug";
    };
    mappings = {
      DD = "shell mv %s ~/.local/share/Trash/files/";
    };
  };
}

