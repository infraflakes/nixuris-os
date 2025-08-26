{
  config,
  pkgs,
  ...
}: {
  users = {
    users = {
      nixuris = {
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = ["networkmanager" "wheel" "libvirtd" "kvm" "adbusers" "podman"];
      };
    };
  };
  programs.fish.enable = true;
  #Sys pkgs
  environment.systemPackages = with pkgs; [htop home-manager ncdu bottom];
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
  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = true;
    };
  };
  networking.firewall.allowedTCPPorts = [22];
  #Disabled systemd services
  systemd = {
    services = {
      NetworkManager-wait-online.enable = false;
      NetworkManager-dispatcher.enable = false;
    };
  };
  #Nix-LD
  programs.nix-ld.enable = true;
  #Required for swaylock to work
  security.pam.services.swaylock = {};

  services.flatpak.enable = true;
}
