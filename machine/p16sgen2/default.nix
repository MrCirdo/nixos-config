{
  pkgs,
  lib,
  config,
  ...
}: {
  gnome.enable = false;
  sway.enable = true;
  kde.enable = false;

  networking.hostName = "Groot";

  hardware = {
    bluetooth.enable = true;
  };

  boot = {
    resumeDevice = "/dev/disk/by-uuid/18aa1876-2f3a-4bf3-916e-c5d5e92ef789";
    kernelParams = ["resume_offset=4100096"];
    kernelPackages = pkgs.linuxKernel.packages.linux_6_9;

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

  services = {
    fprintd = {
      enable = true;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-goodix;
      };
    };
  };

  programs = {
    steam = {
      enable = true;
      # It's for nix unstable
      # extest.enable = true;
      gamescopeSession = {
        enable = true;
        args = [
          # https://github.com/ValveSoftware/gamescope?tab=readme-ov-file#options
        ];
      };
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 5;
        };
      };
    };
  };

  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
  };

  theme = let
    tailwindcss = config.theme.tailwindcss;
  in {
    backgroundColor = tailwindcss.slate."950";
    backgroundColor2 = tailwindcss.slate."900";
    backgroundColor3 = tailwindcss.slate."800";

    focusColor = tailwindcss.slate."500";
    focusColor2 = tailwindcss.slate."600";
    focusColor3 = tailwindcss.slate."400";

    textColor = tailwindcss.slate."100";
    textColor2 = tailwindcss.slate."200";
    textColor3 = tailwindcss.slate."300";

    alertColor = tailwindcss.red."500";

    wallpaper = ../../wallpapers/tankernejla-wallheaver.jpg;
  };

  imports = [./system];
}
