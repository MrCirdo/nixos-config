{
  pkgs,
  pkgs-unstable,
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

    loader = {
      efi.efiSysMountPoint = "/boot";
      grub2-theme = {
        enable = false;
        icon = "color";
      };

      grub = {
        enable = false;
        enableCryptodisk = false;
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

    pipewire = {
      rocSink = {
        enable = true;
        remoteIp = "192.168.1.23";
        fecCode = "rs8m";
        sinkName = "Bonne grosse enceinte";
        openFirewall = true;
      };
    };
  };

  programs = {
    steam = {
      enable = true;
      extest.enable = true;
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
    sudo.fprintAuth = true;
  };

  theme = let
    tailwindcss = config.theme.tailwindcss;
  in {
    backgroundColor = tailwindcss.neutral."950";
    backgroundColor2 = tailwindcss.neutral."900";
    backgroundColor3 = tailwindcss.neutral."800";

    focusColor = tailwindcss.neutral."500";
    focusColor2 = tailwindcss.neutral."600";
    focusColor3 = tailwindcss.neutral."400";

    textColor = tailwindcss.neutral."100";
    textColor2 = tailwindcss.neutral."200";
    textColor3 = tailwindcss.neutral."300";

    alertColor = tailwindcss.red."500";

    wallpaper = ../../wallpapers/kristina-schmid-cropped.jpg;
  };

  imports = [./system];
}
