{
  pkgs,
  lib,
  ...
}: {
  gnome.enable = false;
  sway.enable = true;
  hyprland.enable = false;

  boot = {
    ####resumeDevice = "/dev/disk/by-uuid/d0bcbd38-05f5-4daf-91ab-7d43034e574f";
    #kernelParams = ["resume_offset=13832192"];
    kernelPackages = pkgs.linuxKernel.packages.linux_6_6;
  };

  services.fprintd = {
    enable = false;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };

  security.pam.services = {
    login.fprintAuth = false;
    sudo.fprintAuth = false;
  };

  imports = [./system];
}
