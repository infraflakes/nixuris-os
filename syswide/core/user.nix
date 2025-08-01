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
        extraGroups = ["networkmanager" "wheel" "libvirtd" "kvm" "adbusers"];
      };
    };
  };
  programs.fish.enable = true;
}
