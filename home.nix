{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
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
    ./modules/home/swaylock.nix
    ./modules/home/hypr.nix
  ];
  
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [ fcitx5-unikey ];
      };
    };
  };

  home = {
    username = "nixuris";
    homeDirectory = "/home/nixuris";
    stateVersion = "25.05";
    packages = [pkgs.dconf];
    sessionPath = [ ".local/bin" ];
    sessionVariables = {
      #input
      EDITOR = "nvim";
      VISUAL = "nvim";
      #config
      XDG_CONFIG_HOME = "$HOME/.config";
      NIXOS_OZONE_WL = "1";
      #GTK_THEME = "Adwaita-dark";
    };
  };

  gtk = {
	  enable = true;
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
  };
}
