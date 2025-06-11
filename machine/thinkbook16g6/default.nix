{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}: let
in {
  gnome.enable = false;
  sway.enable = true;
  kde.enable = false;

  networking.hostName = "Dahu";

  hardware = {
    bluetooth.enable = true;
  };

  boot = {
    resumeDevice = "/dev/disk/by-uuid/74c71dfa-0a77-4630-9e5c-eb8824fbc551";
    kernelParams = ["resume_offset=6946816"];

    loader = {
      efi.efiSysMountPoint = "/boot";
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
