{ config, lib, ... }:

let
  commonServices = import ./common;
  waylandServices = import ./wayland;
in { home-manager.sharedModules = [ commonServices waylandServices ]; }
