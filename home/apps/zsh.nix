{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    initContent = ''
      if uwsm check may-start; then 
      	exec uwsm start -S hyprland-uwsm.desktop
      fi
      setopt MENU_COMPLETE
      zmodload zsh/complist
      zstyle ':completion:*' menu yes select
      fastfetch
      printf "\t\t\tWelcome back, %s!\n" "$USER"
    '';
    enableCompletion = true;
    autocd = true;
    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
        "match_prev_cmd"
      ];
    };

    history = {
      size = 100000;
      save = 100000;
      share = true;
      append = true;
      ignoreDups = true;
      expireDuplicatesFirst = true;
      extended = true;
    };

    historySubstringSearch = {
      enable = true;
      searchUpKey = [
        "^[[A"
      ];
      searchDownKey = [
        "^[[B"
      ];
    };

    shellAliases = {
      tm = "tmux new-session -A";
      tc = "tmux new -s";
      ta = "tmux a -t";
      tls = "tmux ls";
      tkill = "tmux kill-session -t";
      se = "sudo -E -s nvim";
      ls = "lsd -l";
      cd = "z";
      nvidia-gpu = "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia";
    };

    syntaxHighlighting = {
      enable = true;
      package = pkgs.zsh-syntax-highlighting;
      styles = {
        default = "fg=white,bold";
        alias = "fg=blue,bold";
        unknown-token = "fg=red,bold";
        reserved = "fg=blue,bold";
        builtin = "fg=blue,bold";
        function = "fg=cyan,bold";
        command = "fg=blue,bold";
        path = "fg=white,bold";
        globbing = "fg=purple,bold";
        single-quoted-argument = "fg=white,bold";
        double-quoted-argument = "fg=white,bold";
        redirection = "fg=blue,bold";
        comment = "fg=black,bold";
      };
    };
  };
}
