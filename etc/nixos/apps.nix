{ config, lib, pkgs, ... }:
{ 
    nixpkgs.config = {
	    packageOverrides = pkgs: {
	    unstable = import <unstable> {};
	    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      				inherit pkgs;
			};
		};
	};
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    fonts.packages = with pkgs; [
	noto-fonts
	noto-fonts-cjk-sans
	noto-fonts-emoji
	nerdfonts
	fira-code
	fira-code-symbols
	font-awesome
    jetbrains-mono
];
  
  programs.adb.enable = true;
  
  programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
          # Add any missing dynamic libraries for unpackaged programs
          # here, NOT in environment.systemPackages
	        glibc
	        cmake
	        gdb
	        libgcc
	        libclang
	        clang-tools
	        libstdcxx5
      ];
  };
    
    nixpkgs.config.qt5 = {
    enable = true;
    platformTheme = "qt5ct"; 
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly Nord Plasma";
    };
};

      # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #Virtual 
    bottles
    
    #dev
    python3            # The Python interpreter
    python3Packages.pip # Optional: Package installer
    python3Packages.virtualenv 
    glib
    clang-tools
    vscode 
    vim
    wget
    git
    gdb
    gcc
    obsidian
    gitui

    #system
    home-manager
	  alacritty
    ranger
    fastfetch
    brightnessctl
    htop
    networkmanagerapplet
    pavucontrol
    atool
    zip
    unzip
    p7zip
    usbutils
	  libsForQt5.qtstyleplugin-kvantum
	  libsForQt5.qt5ct 
    nautilus
	  gnome-software
    
    # Media
	  telegram-desktop
    firefox
    vesktop
    ani-cli
    mpv 
    cmus
	  
    #Others  
    krita	
    ueberzugpp
    zoom-us
    obs-studio
    obs-studio-plugins.wlrobs
    cava
    cbonsai
    cmatrix
    eog
    spicetify-cli
	  
    #Environment
    jq
	  swappy
	  gtk2
	  gtk3
	  gtk4
	  waybar
	  dunst
	  libnotify
	  swww
	  rofi-wayland
	  cliphist
	  swaylock
	  imagemagick
	  grim
	  slurp
	  wl-clipboard
	  wlroots
];
services.gvfs.enable = true;
services.flatpak.enable = true;
}
