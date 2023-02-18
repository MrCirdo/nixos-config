# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.initrd.luks.devices."luks-15aa84af-842a-4fbb-837b-543a6e7db972".device = "/dev/disk/by-uuid/15aa84af-842a-4fbb-837b-543a6e7db972";
}
