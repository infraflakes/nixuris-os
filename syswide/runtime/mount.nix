{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    usbutils
    libimobiledevice
    ifuse
    nemo
    # nautilus
    # sushi
  ];
  services.gvfs.enable = true;
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };
  programs.adb.enable = true;
  users.users.${username}.extraGroups = ["adbusers"];
}
