{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = import programs/i3.nix { inherit pkgs lib; };
  home = {
    username = "odric";
    homeDirectory = "/home/odric";
    packages = builtins.attrValues { inherit (pkgs) vlc discord feh; };
  };

  programs = import ./programs { inherit pkgs; };
  services = import ./services { inherit pkgs; };
}
