{
  config,
  pkgs,
  ...
}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "SemiBold";
        };
        size = 13.0;
      };
      terminal.shell = {
        program = "bash";
        args = [
          "-c"
          "fish"
        ];
      };
      window = {
        #opacity = 0.8;
        decorations = "full";
        padding = {
          x = 15;
          y = 15;
        };
      };

      colors = {
        primary = {
          background = "#1b1e25";
          foreground = "#c0caf5";
        };
        cursor = {
          text = "#24283b";
          cursor = "#c0caf5";
        };
        selection = {
          text = "#c0caf5";
          background = "#283457";
        };
        normal = {
          black = "#1d202f";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#a9b1d6";
        };
        bright = {
          black = "#414868";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#c0caf5";
        };
      };
    };
  };
}
