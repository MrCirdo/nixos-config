{
  config,
  lib,
  ...
}: let
  commonServices = import ./common;
in {
  imports = [./common/spotifyd.nix];
  home-manager.sharedModules = [commonServices];
}
