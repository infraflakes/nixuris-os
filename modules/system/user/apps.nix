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

  environment.systemPackages = with pkgs; [
    bottles
    git 
    vscode #code-cursor #code-editor 
    wget
    obsidian #documentation
    # Media
    ffmpeg
    telegram-desktop
    vesktop
    ani-cli
    mpv 
    cmus youtube-music #music player
    yt-dlp
    libreoffice-fresh
    imv
    firefox
    #Others  
    ueberzugpp
    zoom-us
    obs-studio obs-studio-plugins.wlrobs #obs wayland
    #cava cbonsai cmatrix pipes tty-clock #cli aesthetics
    yad
    imagemagick
    wl-clipboard
];
#services.flatpak.enable = true;
}
