{
  pkgs,
  lib,
  ...
}: {
  gnome.enable = false;
  sway.enable = true;

  boot = {
    ####resumeDevice = "/dev/disk/by-uuid/d0bcbd38-05f5-4daf-91ab-7d43034e574f";
    #kernelParams = ["resume_offset=13832192"];
    kernelPackages = pkgs.linuxKernel.packages.linux_6_6;

    loader = {
      efi.efiSysMountPoint = "/boot/efi";
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
