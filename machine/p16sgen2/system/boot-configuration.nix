# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-094189c7-e343-4b84-b872-9d16eff25799".device = "/dev/disk/by-uuid/094189c7-e343-4b84-b872-9d16eff25799";
}
