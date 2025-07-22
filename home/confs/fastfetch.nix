{
  config,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = builtins.toString ../assets/2b.txt;
        padding = {
          top = 2;
          right = 6;
        };
      };
      display.separator = " ";
      modules = [
        "break"
        "break"
        {
          type = "title";
          keyWidth = 10;
        }
        "break"
        {
          type = "os";
          key = " ";
          keyColor = "33";
        }
        {
          type = "uptime";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "33";
        }
        {
          type = "cpu";
          format = "{1} @ {7}";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "gpu";
          format = "{1} {2}";
          key = " ├ 󰢮 ";
          keyColor = "33";
        }
        {
          type = "packages";
          key = " ";
          keyColor = "33";
        }
        {
          type = "shell";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "terminal";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "wm";
          key = " ├  ";
          keyColor = "33";
        }
        "break"
        {
          type = "media";
          key = "󰝚 ";
          keyColor = "33";
        }
        "break"
        "break"
      ];
    };
  };
}
