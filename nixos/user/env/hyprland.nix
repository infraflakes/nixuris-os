{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
	home-manager #handling gtk and nvim
	cool-retro-term #terminal
	ranger #file-manager
	fastfetch #fetch
	brightnessctl #brightness changing
	bc jq #lib for scripts
	pavucontrol #volume control 
	yad #display keybinding
	waybar #panel
	dunst libnotify #notification
	swww imagemagick #wallpaper
	rofi-wayland #instances launcher
	wl-clipboard cliphist #clipboard
	swaylock #lockscreen
	grim slurp swappy #screenshot
	wlroots
];
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
