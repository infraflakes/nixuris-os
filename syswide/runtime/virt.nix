{
  config,
  pkgs,
  lib,
  ...
}: {
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.package = pkgs.qemu_kvm;
  programs.virt-manager.enable = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  users.users.nixuris.extraGroups = ["libvirtd" "kvm"];
}
