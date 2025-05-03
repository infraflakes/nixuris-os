{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nixuris";
  home.homeDirectory = "/home/nixuris";
  imports = [
    ./modules/home/alacritty.nix
    ./modules/home/cava.nix
    ./modules/home/fastfetch.nix
    ./modules/home/fish.nix
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.

 
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
     pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nixuris/etc/profile.d/hm-session-vars.sh
  #
  home.sessionPath = [ ".local/bin" ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    #GTK_THEME = "Adwaita-dark";
  };
programs.neovim = {
  enable = true;
  viAlias = true;
  vimAlias = true;
};

  gtk = {
	cursorTheme = {
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Ice";
};
	theme = {
    #Tokyonight-Dark
    #package = pkgs.tokyo-night-gtk;
		#name = "Tokyonight-Dark";
    
    #Catppuccin Blue
    package = pkgs.catppuccin-gtk;
		name = "catppuccin-frappe-blue-standard";
		
    #Adwaita-dark
    #package = pkgs.gnome-themes-extra;
		#name = "Adwaita-dark";
};
	iconTheme = {
		package = pkgs.papirus-icon-theme;
		name = "Papirus-Dark";
};
	enable = true;
};
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
