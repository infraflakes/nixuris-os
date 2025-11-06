{
  config,
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    # shell = "${pkgs.zsh}/bin/zsh";
    historyLimit = 50000;
    baseIndex = 1;
    mouse = true;
    escapeTime = 10;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
    ];
    # Extra lines that don’t have first-class options
    extraConfig = ''
      set -g renumber-windows on
      set-option -g allow-rename off
      set -g detach-on-destroy off

      # ----- begin custom no-prefix binds -----

      bind -n C-Left  switch-client -p
      bind -n C-Right switch-client -n
      bind -n C-n new-session
      bind -n C-x confirm-before -p "kill session #S? (y/n)" "kill-session"

      bind -n M-v split-window -h
      bind -n M-h split-window -v
      bind -n M-Down    select-pane -t :.+
      bind -n M-Up  select-pane -t :.-

      # vi selection keys inside copy-mode
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
      bind -n M-y copy-mode
      bind -T copy-mode-vi M-y send-keys -X cancel

      bind -n M-x kill-pane
      bind -n M-a choose-tree -s
      bind -n M-n new-window
      bind -n M-q detach-client
      bind -n M-Left  previous-window
      bind -n M-Right next-window

      bind -n C-r command-prompt -I '#S' 'rename-session -- "%%"'   # session
      bind -n M-r command-prompt -I '#W' 'rename-window "%%"' 	#window

      # 1.  Alt-m enters the “move” table
      bind -n M-m switch-client -T move

      # 2.  while in that table < / > shift the window, then drop back to root
      bind -T move Left swap-window -d -t -1 \; switch-client -T root
      bind -T move Right swap-window -d -t +1 \; switch-client -T root

      # 3.  any other key (or Escape) just cancels the mode
      bind -T move Escape switch-client -T root

      # ---------- resurrect / continuum ----------
      set -g @resurrect-capture-pane-contents 'on'   # optional: keep scrollback
      set -g @continuum-save-interval '1'            # minutes between snapshots
      set -g @continuum-restore 'on'                 # restore on tmux start

      # ------ theming -------
      set -g status-right-style 'fg=blue bg=default'
      set -g status-right '%Y-%m-%d %H:%M '
      set -g status-right-length 50

      set -g status-left '[#S] '
      set -g status-left-length 0        # 40 plenty of room, or 0 for unlimited

      set -g status-position bottom
      set -g status-justify left
      set -g status-style 'bg=default'

      setw -g window-status-style 'fg=green bg=black'
      setw -g window-status-format ' #I #[fg=white]#W #[fg=blue]#F '

      setw -g window-status-current-style 'fg=black bg=blue'
      setw -g window-status-current-format ' #I #W #F '
    '';
  };
  home.packages = with pkgs; [
    wl-clipboard
  ];
}
