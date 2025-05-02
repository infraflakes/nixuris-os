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
     

      # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bottles
    git 
    vscode #code-cursor #code-editor 
    wget
    obsidian #documentation
    #zsh
    # Media
    ffmpeg
    telegram-desktop
    vesktop
    ani-cli
    mpv 
    cmus youtube-music #music player
    yt-dlp
    libreoffice-fresh
    #beatprints
    imv
    firefox
    #Others  
    #krita	
    ueberzugpp
    zoom-us
    obs-studio obs-studio-plugins.wlrobs #obs wayland
    cava #cbonsai cmatrix pipes tty-clock #cli aesthetics
    #eog
];
#services.flatpak.enable = true;
}
