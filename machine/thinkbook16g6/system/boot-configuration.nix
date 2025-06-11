# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      systemd.enable = true;
      luks.devices."root" = {
        device = "/dev/disk/by-uuid/536104c3-6781-49bb-ac46-02ddab4777e4";
      };
    };
    lanzaboote = {
      enable = false;
      pkiBundle = "/etc/secureboot";
    };
  };

  environment.systemPackages = [
    pkgs.sbctl
  ];
}
