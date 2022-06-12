{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = import programs/i3.nix { inherit pkgs lib; };
  home = {
    username = "odric";
    homeDirectory = "/home/odric";
    packages = builtins.attrValues {
      inherit (pkgs)
        vlc discord feh tree gcc gdb gnumake automake autogen autoconf cmake zip
        unzip bitwarden thunderbird mpv jellyfin-mpv-shim;
    };

    file.".doom.d" = { # Get Doom Emacs
      source =
        ./programs/doom-emacs/doom.d; # Sets up symlink name ".doom.d" for file "doom.d"
      recursive = true; # Allow symlinking a directory
      onChange = builtins.readFile
        ./programs/doom-emacs/doom.sh; # If an edit is detected, it will run this script
    };
  };

  programs = import ./programs { inherit pkgs; };
  services = import ./services { inherit pkgs; };
}
