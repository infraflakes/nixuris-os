{
  config,
  pkgs,
  lib,
  ...
}:
{
  #sudo supergfxctl -m Vfio and detach nvidia components with virsh nodedev-detach pci_0000_01_00_1 and virsh nodedev-detach pci_0000_01_00_0 before adding to pci

  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
    "vfio-pci.ids=10de:28e1,10de:22be"
  ];
  boot.initrd.kernelModules = [
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
    "i915"
  ];
  # ─── LIBVIRTD & QEMU ─────────────────────────────────────────
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.package = pkgs.qemu_kvm;
  programs.virt-manager.enable = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true; # enable copy and paste between host and guest
  virtualisation.spiceUSBRedirection.enable = true;
  users.users.nixuris.extraGroups = [
    "libvirtd"
    "kvm"
  ];
}
