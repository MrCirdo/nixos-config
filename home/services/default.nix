{
  config,
  lib,
  ...
}: let
  commonServices = import ./common;
  waylandServices = import ./wayland;
in {
  imports = [./common/spotifyd.nix];
  home-manager.sharedModules = [commonServices waylandServices];
}
