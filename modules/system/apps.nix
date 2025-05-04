{ config, lib, pkgs, ... }:
{ 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bottles
    git 
    #vscode #code-cursor #code-editor 
    #obsidian #documentation
    
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
    #cbonsai cmatrix pipes tty-clock #cli aesthetics
    yad
    imagemagick
    wl-clipboard
    pavucontrol #volume control
    libnotify
    wlroots


];
  
  #services.flatpak.enable = true;
}
