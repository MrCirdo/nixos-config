{ pkgs, lib, ... }:

{
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
  };

  xsession.windowManager.i3 = import programs/i3.nix { inherit pkgs lib; };
}
