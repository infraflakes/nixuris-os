{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    usbutils
    libimobiledevice
    ifuse
    nautilus
    sushi
  ];
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };
  programs.adb.enable = true;
  users.users.nixuris.extraGroups = [ "adbusers" ];
}
