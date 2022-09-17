{ pkgs, ... }:

{
  picom = import ./picom.nix { };
  polybar = import ./polybar { inherit pkgs; };
  gammastep = import ./gammastep.nix { };
  gpg-agent = import ./gpg-agent.nix {  };
}
