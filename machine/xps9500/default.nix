{pkgs, lib, ...}: {
  gnome.enable = true;
  sway.enable = false;
  hyprland.enable = false;

  powerManagement = {
    powerUpCommands = "${pkgs.kmod}/bin/modprobe hci_uart && ${pkgs.kmod}/bin/modprobe ath11k_pci";
    powerDownCommands = "${pkgs.kmod}/bin/rmmod hci_uart && ${pkgs.kmod}/bin/rmmod ath11k_pci";
   };

  boot.resumeDevice = "/dev/disk/by-uuid/d0bcbd38-05f5-4daf-91ab-7d43034e574f";
  boot.kernelParams = ["resume_offset=13832192"];
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_3;

  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };

  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
  };

  imports = [./system];
}
