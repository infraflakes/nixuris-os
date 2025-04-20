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
	        cmake
	        gdb
	        libgcc
	        libclang
	        clang-tools
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
   bottles

   #dev
    jdk
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
    nodejs_23
    pnpm
    obsidian
    gitui
    code-cursor 
    tree

    #system
    pciutils
    alacritty
    fastfetch
    htop
    networkmanagerapplet
    atool
    zip
    unzip
    p7zip
    usbutils
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct 
    nautilus
    sushi
   
    # Media
    telegram-desktop
    vesktop
    ani-cli
    mpv 
    cmus
    youtube-music
    yt-dlp
    libreoffice-fresh
    
    #Others  
    krita	
    ueberzugpp
    zoom-us
    obs-studio
    obs-studio-plugins.wlrobs
    cava
    cbonsai
    cmatrix
    pipes
    tty-clock
    eog
];
services.flatpak.enable = true;
services.gvfs.enable = true; # Mount, trash, and other functionalities
}
