{
  pkgs,
  lib,
  ...
}: {
  gnome.enable = false;
  sway.enable = true;

  boot = {
    resumeDevice = "/dev/disk/by-uuid/18aa1876-2f3a-4bf3-916e-c5d5e92ef789";
    kernelParams = ["resume_offset=4100096"];
    kernelPackages = pkgs.linuxKernel.packages.linux_6_6;

    loader = {
      efi.efiSysMountPoint = "/boot";
      grub2-theme = {
        enable = false;
        icon = "color";
      };

      grub = {
        enable = false;
        enableCryptodisk = true;
        device = "nodev";
        efiSupport = true;
        extraEntries = ''
          menuentry "Windows" --class windows {
            insmod part_gpt
            insmod fat
            insmod search_fs_uuid
            insmod chain
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '';
      };
    };
  };

  powerManagement = {
    powerDownCommands = ''
      ${pkgs.util-linux}/bin/rfkill block wlan && ${pkgs.coreutils}/bin/sleep 1 && ${pkgs.kmod}/bin/rmmod ath11k_pci && ${pkgs.coreutils}/bin/sleep 1
    '';
    powerUpCommands = "${pkgs.kmod}/bin/modprobe ath11k_pci && ${pkgs.coreutils}/bin/sleep 1 && ${pkgs.util-linux}/bin/rfkill unblock wlan";
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
