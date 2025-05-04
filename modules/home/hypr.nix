{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
	pavucontrol #volume control 
	swww #wallpaper
	wlroots
	hypridle
	wlogout
	eww
	#networkmanagerapplet
];
    services.cliphist.enable = true;
    services.blueman.enable = true;
    xdg.portal.enable = true;
    xdg.portal.extraPortals  = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr];
    programs.hyprland = {
	  enable = true;
	  xwayland.enable = true;
};
    environment.sessionVariables = {
	#WLR_NO_HARDWARE_CURSORS ="1";
	NIXOS_OZONE_WL = "1";
};
}
