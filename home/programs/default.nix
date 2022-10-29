{ lib, pkgs, config, ... }:
let commonPrograms = import ./common;
in { home-manager.sharedModules = [ commonPrograms ]; }
