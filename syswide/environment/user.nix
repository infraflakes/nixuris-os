{
  config,
  pkgs,
  ...
}: {
  services.accounts-daemon.enable = true; # Fix profile picture disappear after reboot
  users.users = {
    infraflakes = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
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
  #Time zone
  time.timeZone = "Asia/Ho_Chi_Minh";
  services.timesyncd.enable = true;
  #Network
  networking = {
    hostName = "serein";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1"];
  };
  security.pam.services.swaylock = {};
  systemd.sleep.extraConfig = ''
    SuspendState=mem
    HibernateState=disk
    HibernateDelaySec=45min
  '';
}
