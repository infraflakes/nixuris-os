{config, pkgs, ...}: {
  users = {
    users = {
      nixuris = {
        isNormalUser = true;
        extraGroups = ["networkmanager" "wheel" "libvirtd" "kvm" "adbusers"];
      };
    };
  };
}
