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
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      systemd.enable = true;
      luks.devices."root" = {
        device = "/dev/disk/by-uuid/07425910-1a81-4a04-8366-2ce9560fb012";
        crypttabExtraOpts = [ "tpm2-device=auto" "tpm2-measure-pcr=yes" ];
      };
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };

  environment.systemPackages = [
    pkgs.sbctl
  ];
}
