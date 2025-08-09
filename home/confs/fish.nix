{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [zoxide];
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  home.file.".config/fish/conf.d/npm.fish".text = ''
      set -gx NPM_GLOBAL_BIN "$HOME/.local/bin"
    if not string match -q -- $NPM_GLOBAL_BIN $PATH
      set -gx PATH "$NPM_GLOBAL_BIN" $PATH
    end
  '';
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = '''';
      fish_prompt = ''
        echo
        set_color -o 4a4b52
        echo -n ""
        set_color normal
        set_color -o 8ab4f8
        set_color -b 4a4b52
        echo -n "  "
        set_color normal
        set_color -o 8ab4f8
        set_color -b 4a4b52
        echo -n (prompt_pwd)
        set_color normal
        set_color -o 4a4b52
        echo -n ""
        set_color normal
        echo -n (set_color -o 8ab4f8)" ❯ "
      '';
    };
    shellAliases = {
      nixgen = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      homegen = "home-manager generations";
      nixgen-d = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations";
      homegen-d = "home-manager remove-generations";
      xu = "nix flake update";
      xs = "sudo nixos-rebuild switch --impure --flake .#serein";
      zs = "home-manager switch --flake .#nixuris@serein";
      xr = "sudo nix-collect-garbage -d";
      gcs = "git clone --depth=1";
      e = "nvim";
      se = "sudo -E -s nvim";
      nvidia-gpu = "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia";
    };
    interactiveShellInit = ''
      fastfetch
      set username (whoami)
      echo "				Welcome back, $username!"
      fish_add_path .local/bin
      fish_add_path .cargo/bin
    '';
    shellInit = ''
      set -g fish_color_normal ccd0d9 --bold
      set -g fish_color_command 8ab4f8 --bold
      set -g fish_color_keyword ccd0d9 --bold
      set -g fish_color_quote ccd0d9 --bold
      set -g fish_color_redirection 8ab4f8 --bold
      set -g fish_color_end ccd0d9 --bold
      set -g fish_color_error cf6679 --bold
      set -g fish_color_param ccd0d9 --bold
      set -g fish_color_comment ccd0d9 --bold
      set -g fish_color_selection --reverse --bold
      set -g fish_color_operator ccd0d9 --bold
      set -g fish_color_escape ccd0d9 --bold
      set -g fish_color_autosuggestion 908caa --bold
      set -g fish_color_cwd ccd0d9 --bold
      set -g fish_color_user ccd0d9 --bold
      set -g fish_color_host ccd0d9 --bold
      set -g fish_color_host_remote ccd0d9 --bold
      set -g fish_color_cancel ccd0d9 --bold
      set -g fish_color_search_match --background=ccd0d9 --bold
      set -g fish_color_valid_path --bold

      set -g fish_pager_color_progress c4a7e7
      set -g fish_pager_color_background --background=1f1d2e
      set -g fish_pager_color_prefix 9ccfd8
      set -g fish_pager_color_completion 908caa
      set -g fish_pager_color_description 908caa
      set -g fish_pager_color_selected_background --background=26233a
      set -g fish_pager_color_selected_prefix 9ccfd8
      set -g fish_pager_color_selected_completion bfc9db
      set -g fish_pager_color_selected_description bfc9db
    '';
  };
}
