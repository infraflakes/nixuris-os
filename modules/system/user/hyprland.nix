{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
	brightnessctl #brightness changing
	bc jq #lib for scripts
	pavucontrol #volume control 
	yad #display keybinding
	waybar #panel
	libnotify #notification
	swww imagemagick #wallpaper
	rofi-wayland #instances launcher
	swaynotificationcenter #gui for notification center
	wl-clipboard cliphist #clipboard
	swaylock #lockscreen
	grim slurp swappy #screenshot
	wlroots
	hypridle
	wlogout
	eww
	#networkmanagerapplet
];
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
