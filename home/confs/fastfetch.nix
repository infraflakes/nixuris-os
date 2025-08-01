{
  config,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = builtins.toString ./config/fastfetch/2b.txt;
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
          key = "  distro ";
          keyColor = "33";
        }
	{
          type = "kernel";
          key = "  kernel ";
          keyColor = "33";
        }
        {
          type = "uptime";
          key = "  uptime ";
          keyColor = "33";
        }
        {
          type = "memory";
          key = "  memory ";
          keyColor = "33";
        }
        {
          type = "disk";
          key = "󰋊  disk   ";
          keyColor = "33";
        }
        {
          type = "packages";
          key = "  pkgs   ";
          keyColor = "33";
        }
        {
          type = "media";
          key = "󰝚  media  ";
          keyColor = "33";
        }
        "break"
        "break"
      ];
    };
  };
}
