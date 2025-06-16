{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./core/hardware-configuration.nix
    ./core/sys.nix
    ./core/graphics.nix
    ./core/power.nix

    ./runtime/gaming.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11";
  users.users.nixuris = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "libvirtd" "kvm" "adbusers"];
  };
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
}
