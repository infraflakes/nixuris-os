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

      programs.nix-ld.enable = true;
  programs.adb.enable = true;
  programs.nix-ld.libraries = with pkgs; [

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
    python3            # The Python interpreter
    python3Packages.pip # Optional: Package installer
    python3Packages.virtualenv
    nur.repos.ataraxiasjel.waydroid-script 
    home-manager
    scrcpy
    glib
    clang-tools
    vscode 
    vim
    wget
    nitch
    git
    ranger
    gdb
    gcc
    fastfetch
    brightnessctl
    firefox
    vesktop
    qtscrcpy
    ani-cli
    mpv 
    cmus
    htop
    networkmanagerapplet
    obsidian
    zip
    unzip
    p7zip
    ueberzugpp
    gitui
    zoom-us
    obs-studio
    microsoft-edge
    obs-studio-plugins.wlrobs
    cava
    cbonsai
    usbutils
    cmatrix
    eog
    atool
    pavucontrol
    spicetify-cli
	jq
	libsForQt5.qtstyleplugin-kvantum
	libsForQt5.qt5ct 
	swappy
	gtk2
	gtk3
	gtk4
	waybar
	dunst
	libnotify
	swww
	alacritty
    	kitty
	rofi-wayland
	cliphist
	swaylock
	imagemagick
	grim
	slurp
	wl-clipboard
	wlroots
	krita	
	gnome-software
	telegram-desktop
];
    #Thunar
    programs = {
        file-roller.enable = true;
        thunar.enable = true;
        xfconf.enable = true;
        thunar.plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
    ];
};
    services.tumbler.enable = true; # Thumbnail support for images

services.flatpak.enable = true;
}
