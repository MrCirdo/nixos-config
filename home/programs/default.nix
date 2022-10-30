{ lib, pkgs, config, ... }: {
  home-manager.sharedModules = [ (import ./common) (import ./wayland) ];
}
