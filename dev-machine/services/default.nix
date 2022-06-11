{ pkgs, ... }:

{
  picom = import ./picom.nix { };
  polybar = import ./polybar.nix { inherit pkgs; };
}
