{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    usbutils
    libimobiledevice
    ifuse
    nautilus
    sushi
    #jmtpfs
  ];
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };
  programs.adb.enable = true;
  #services.udisks2.enable = true;
  services.gvfs.enable = true;
}
