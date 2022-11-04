{
  config,
  lib,
  ...
}: let
  windowManagers = import ./windowManagers;
in {home-manager.sharedModules = [windowManagers];}
