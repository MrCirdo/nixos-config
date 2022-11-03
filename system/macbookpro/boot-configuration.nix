# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.initrd.luks.devices."luks-6caf388a-afa8-43a0-a29b-7b41e5128538".device = "/dev/disk/by-uuid/6caf388a-afa8-43a0-a29b-7b41e5128538";
  boot.initrd.luks.devices."luks-6caf388a-afa8-43a0-a29b-7b41e5128538".keyFile = "/crypto_keyfile.bin";
}
