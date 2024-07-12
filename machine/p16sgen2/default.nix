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
    kernelParams = [
      "resume_offset=4100096"
      "iommu=pt"
      "vfio-pci.ids=1002:15bf"
      "kvm.ignore_msrs=1"
      "video=vesafb:off,efifb:off"
      # "console=ttyUSB0,115200n8"
      # "console=tty1"
    ];

    modprobeConfig = {
      enable = true;
    };

    # extraModprobeConfig = ''
    #   options vfio-pci ids=1002:15bf disable_vga=1
    #   softdep amdgpu pre: vfio-pci
    #   softdep drm pre: vfio-pci
    # '';

    kernelPackages = pkgs.linuxKernel.packages.linux_6_9;
    # blacklistedKernelModules = ["amdgpu"];
    # kernelModules = ["vfio-pci" "vfio" "vfio_iommu_type1"];

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

  systemd.services."launch-vm" = {
    enable = false;
    wantedBy = ["multi-user.target"];
    description = "Launch Mac os vm";
    serviceConfig = {
      Type = "exec";
      ExecStart = "/home/odric/OSX-KVM/boot-passthrough.sh";
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

    udev.extraRules = ''
      SUBSYSTEM=="vfio", OWNER="root", GROUP="kvm"
    '';

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
