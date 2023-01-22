# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/hardware/network/broadcom-43xx.nix")
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];
  boot.kernelParams = ["resume_offset=14596096"];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4f2609f9-0e39-47c0-a3fd-72affaa250e8";
    fsType = "ext4";
  };

  boot.resumeDevice = "/dev/disk/by-uuid/4f2609f9-0e39-47c0-a3fd-72affaa250e8";

  boot.initrd.luks.devices."luks-fb6e9567-a32a-431d-a7ac-e923c8e37141".device = "/dev/disk/by-uuid/fb6e9567-a32a-431d-a7ac-e923c8e37141";

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/540E-C77C";
    fsType = "vfat";
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/6e5f19db-2ca8-40d7-834d-93073b6e788f";
      priority = 32767;
    }
  ];

  boot.tmpOnTmpfs = false;

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;

  powerManagement.powertop.enable = false;

  boot.kernelParams = ["i915.force_probe=162b"];
}
