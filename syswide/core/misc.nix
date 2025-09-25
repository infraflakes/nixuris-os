{
  config,
  pkgs,
  ...
}:
{
  #Sys pkgs
  environment.systemPackages = with pkgs; [
    htop
    home-manager
    ncdu
    bottom
  ];
  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = true;
    };
  };
  networking.firewall.allowedTCPPorts = [ 22 ];
  #Disabled systemd services
  systemd = {
    services = {
      NetworkManager-wait-online.enable = false;
      NetworkManager-dispatcher.enable = false;
    };
  };
  #Nix-LD
  programs.nix-ld.enable = true;
  #services.flatpak.enable = true;
}
