{
  config,
  pkgs,
  ...
}:

{
  programs.tmux = {
    enable = true;

    # History that survives a long build
    historyLimit = 50000;

    # Start windows/panes at 1 instead of 0
    baseIndex = 1;

    # Mouse on (scroll, resize, select)
    mouse = true;

    # Fast escape for vim/nvim
    escapeTime = 10;

    # Vi-style navigation in copy mode
    keyMode = "vi";

    # tmuxPlugins
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.yank
    ];
    # Extra lines that don’t have first-class options
    extraConfig = ''
      set -g renumber-windows on
      set-option -g allow-rename off
    '';
  };
  home.packages = with pkgs; [
    wl-clipboard
  ];
}
