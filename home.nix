{ config, pkgs, ... }:

{
  home.username = "nixuris";
  home.homeDirectory = "/home/nixuris";
  imports = [
    ./modules/home/alacritty.nix
    ./modules/home/cava.nix
    ./modules/home/fastfetch.nix
    ./modules/home/fish.nix
    ./modules/home/ranger.nix
    ./modules/home/swaync.nix
    ./modules/home/rofi.nix
    ./modules/home/nvim.nix
    ./modules/home/waybar.nix
    ./modules/home/swappy.nix
  ];

  home.stateVersion = "25.05";

 
  home.packages = [
     
  ];

  home.sessionPath = [ ".local/bin" ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    XDG_CONFIG_HOME = "$HOME/.config";
    #GTK_THEME = "Adwaita-dark";
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
  programs.home-manager.enable = true;
}
