{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}: let
  heroic-gamescope = pkgs.writeShellScriptBin "heroic-gamescope" ''
    gamescope --mangoapp -- ${pkgs-unstable.heroic}/bin/heroic
  '';

  gamescopeSessionFile =
    (pkgs.writeTextDir "share/wayland-sessions/heroic-games-launcher.desktop" ''
      [Desktop Entry]
      Name=Heroic
      Comment=A digital distribution platform
      Exec=${heroic-gamescope}/bin/heroic-gamescope
      Type=Application
    '')
    .overrideAttrs (_: {passthru.providedSessions = ["heroic-games-launcher"];});
in {
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
    kernel.sysctl = {"kernel.perf_event_paranoid" = 1;};
    kernelPackages = pkgs-unstable.linuxPackages_latest;

    loader = {
      timeout = 0;
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

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=60m
  '';

  services = {
    logind = {
      settings = {
        Login.HandleLidSwitch = "suspend-then-hibernate";
      };
    };
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
        remoteIp = "192.168.1.12";
        fecCode = "rs8m";
        sinkName = "Bonne grosse enceinte";
        openFirewall = true;
      };
    };

    displayManager.sessionPackages = [gamescopeSessionFile];

    upower = {
      enable = true;
      allowRiskyCriticalPowerAction = true;
      criticalPowerAction = "Hibernate";
    };
  };

  programs = {
    gamescope = {
      enable = true;
       capSysNice = true;
    };
    steam = {
      enable = true;
      package = pkgs-unstable.steam;
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
    backgroundColor = tailwindcss.stone."900";
    backgroundColor2 = tailwindcss.stone."800";
    backgroundColor3 = tailwindcss.stone."700";

    focusColor = tailwindcss.stone."500";
    focusColor2 = tailwindcss.stone."600";
    focusColor3 = tailwindcss.stone."400";

    textColor = tailwindcss.stone."100";
    textColor2 = tailwindcss.stone."200";
    textColor3 = tailwindcss.stone."300";

    alertColor = tailwindcss.red."500";

    wallpaper = ../../wallpapers/thedrexter-wallheaver.png;
  };

  imports = [./system];
}
