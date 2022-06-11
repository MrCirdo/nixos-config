{ pkgs, ... }:

{
  xsession.windowManager.i3 = import programs/i3.nix { inherit pkgs; };
  home = {
    username = "odric";
    homeDirectory = "/home/odric";
    packages = builtins.attrValues { inherit (pkgs) vlc discord feh vscode; };
  };

  programs = import ./programs { inherit pkgs; };
}
