{
  config,
  pkgs,
  lib,
  ...
}:{
  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
    "vfio-pci.ids=10de:28e1,10de:22be"
  ];
  boot.initrd.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" "i915"];
  config = {
    # ─── LIBVIRTD & QEMU ─────────────────────────────────────────
    virtualisation.libvirtd.enable = true;
    virtualisation.libvirtd.qemu.package = pkgs.qemu_kvm;
    programs.virt-manager.enable = true;
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true; # enable copy and paste between host and guest
    virtualisation.spiceUSBRedirection.enable = true; 
  };
}
