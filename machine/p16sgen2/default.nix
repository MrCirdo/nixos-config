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
    backgroundColor = tailwindcss.orange."950";
    backgroundColor2 = tailwindcss.orange."900";
    backgroundColor3 = tailwindcss.orange."800";

    focusColor = tailwindcss.orange."500";
    focusColor2 = tailwindcss.orange."600";
    focusColor3 = tailwindcss.orange."400";

    textColor = tailwindcss.orange."100";
    textColor2 = tailwindcss.orange."200";
    textColor3 = tailwindcss.orange."300";

    alertColor = tailwindcss.red."500";

    wallpaper = ../../wallpapers/hexzit.jpg;
  };

  imports = [./system];
}
