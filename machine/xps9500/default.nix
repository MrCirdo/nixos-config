{
  config,
  pkgs,
  lib,
  ...
}: {
  gnome.enable = false;
  sway.enable = true;

  nixpkgs.config.nvidia.acceptLicense = true;

  networking.hostName = "Wookie";

  boot = {
    tmp.useTmpfs = true;
    kernelPackages = pkgs.linuxKernel.packages.linux_6_9;
  };

  services = {
    rpcbind.enable = true;
    cachefilesd = {
      enable = true;
      cacheDir = "/home/odric/quod-projects/nfs/cache";
    };

    fprintd = {
      enable = true;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-goodix;
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
    backgroundColor = tailwindcss.slate."900";
    backgroundColor2 = tailwindcss.slate."800";
    backgroundColor3 = tailwindcss.slate."700";

    focusColor = tailwindcss.slate."500";
    focusColor2 = tailwindcss.slate."400";
    focusColor3 = tailwindcss.slate."300";

    textColor = tailwindcss.slate."100";
    textColor2 = tailwindcss.slate."200";
    textColor3 = tailwindcss.slate."300";

    alertColor = tailwindcss.red."500";
    wallpaper = ../../wallpapers/dasangrypanda-wallhaven.png;
  };

  imports = [./system];
}
