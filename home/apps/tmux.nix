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

      # ----- begin custom no-prefix binds -----

      bind -n C-Left  switch-client -p
      bind -n C-Right switch-client -n
      bind -n C-n new-session

      bind -n M-v split-window -h
      bind -n M-s split-window -v
      bind -n M-Down    select-pane -t :.+
      bind -n M-Up  select-pane -t :.-

      bind -n M-y copy-mode
      bind -n M-x kill-pane
      bind -n M-a choose-tree -s
      bind -n M-n new-window
      bind -n M-q detach-client
      bind -n M-Left  previous-window
      bind -n M-Right next-window

      bind -n C-r command-prompt -I '#S' 'rename-session -- "%%"'   # session
      bind -n M-r command-prompt -I '#W' 'rename-window "%%"' 	#window
    '';
  };
  home.packages = with pkgs; [
    wl-clipboard
  ];
}
