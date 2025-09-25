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
        opacity = 0.8;
        decorations = "full";
        padding = {
          x = 15;
          y = 15;
        };
      };

      colors = {
        primary = {
          background = "#1b1e25";
          foreground = "#eeedee";
        };

        cursor = {
          text = "#000000";
          cursor = "#7f7f7f";
        };

        selection = {
          text = "#000000";
          background = "#b4d5ff";
        };

        normal = {
          black = "#4f4f4f";
          red = "#fa6c5f";
          green = "#a8fe60";
          yellow = "#586eae";
          blue = "#6b82ba";
          magenta = "#6383cf";
          cyan = "#6383aa";
          white = "#eeedee";
        };

        bright = {
          black = "#7b7b7b";
          red = "#fcb6af";
          green = "#ceffab";
          yellow = "#fffecc";
          blue = "#b5dcfe";
          magenta = "#fb9bfe";
          cyan = "#dfdffd";
          white = "#fefffe";
        };
      };
    };
  };
}
