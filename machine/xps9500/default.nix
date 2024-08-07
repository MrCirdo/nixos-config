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

  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
  };

  theme = let
    tailwindcss = config.theme.tailwindcss;
  in {
    backgroundColor = tailwindcss.zinc."950";
    backgroundColor2 = tailwindcss.zinc."900";
    backgroundColor3 = tailwindcss.zinc."800";

    focusColor = tailwindcss.zinc."500";
    focusColor2 = tailwindcss.zinc."400";
    focusColor3 = tailwindcss.zinc."300";

    textColor = tailwindcss.zinc."100";
    textColor2 = tailwindcss.zinc."200";
    textColor3 = tailwindcss.zinc."300";

    alertColor = tailwindcss.red."500";
    wallpaper = ../../wallpapers/yotoon.jpg;
  };

  imports = [./system];
}
