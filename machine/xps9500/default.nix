{
  pkgs,
  lib,
  ...
}: {
  gnome.enable = false;
  sway.enable = true;

  powerManagement = {
    powerDownCommands = "${pkgs.util-linux}/bin/rfkill block wlan && ${pkgs.coreutils}/bin/sleep 2 && ${pkgs.kmod}/bin/rmmod ath11k_pci hci_uart btqca && ${pkgs.coreutils}/bin/sleep 2";
    powerUpCommands = "${pkgs.kmod}/bin/modprobe ath11k_pci hci_uart btqca && ${pkgs.coreutils}/bin/sleep 2 && ${pkgs.util-linux}/bin/rfkill unblock wlan";
  };

  boot = {
    resumeDevice = "/dev/disk/by-uuid/d0bcbd38-05f5-4daf-91ab-7d43034e574f";
    kernelParams = ["resume_offset=24023040"];
    kernelPackages = pkgs.linuxKernel.packages.linux_6_7;
  };

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
