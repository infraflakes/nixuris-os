{ config, lib, pkgs, ... }:
{
    users.users.irisu = {
    isNormalUser = true;
    description = "irisu";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "adbusers" ];
    packages = with pkgs; [];
  }; 
    users.defaultUserShell = pkgs.fish;
    environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";
    services.xserver.excludePackages = with pkgs; [nano xterm];
    #programs.neovim = {
  #	enable = true;
  #	defaultEditor = true;
  #};

}
