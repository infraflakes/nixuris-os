{ config, lib, pkgs, ... }:
{ 
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    fonts.packages = with pkgs; [
	noto-fonts
	noto-fonts-cjk-sans
	noto-fonts-emoji
	nerd-fonts.jetbrains-mono
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
	        glibc
	        libgcc
	        libclang
		xorg.libxcb
      ];
  };
    

      # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   bottles

    #dev
    
    #C/C++ 
    gcc
    gdb
    clang-tools
    cmake
    #Java
    jdk
    
    #JS
    nodejs_23
    pnpm
    
    #Python
    python3            # The Python interpreter
    python3Packages.pip # Optional: Package installer
    python3Packages.virtualenv 
    
    vscode code-cursor #code-editor 
    vim
    wget
    obsidian #documentation
    git gitui #github

    #system
		glib
    pciutils
    tree
    alacritty
    fastfetch
    htop
    networkmanagerapplet
    atool
    zip
    unzip
    p7zip
    usbutils
    nautilus
    sushi
   
    # Media
    telegram-desktop
    vesktop
    ani-cli
    mpv 
    cmus youtube-music #music player
    yt-dlp
    libreoffice-fresh
    
    #Others  
    krita	
    ueberzugpp
    zoom-us
    obs-studio obs-studio-plugins.wlrobs #obs wayland
    cava cbonsai cmatrix pipes tty-clock #cli aesthetics
    eog
];
services.flatpak.enable = true;
services.gvfs.enable = true; # Mount, trash, and other functionalities
}
