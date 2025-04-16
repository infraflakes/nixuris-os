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

    i18n.defaultLocale = "en_US.UTF-8";
    i18n.inputMethod = {
    enable = true;
    fcitx5.waylandFrontend = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-unikey ];
  };
    i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

}
