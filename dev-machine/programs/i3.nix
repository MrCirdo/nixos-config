{ pkgs, lib, ... }:

let
  wallpaper = builtins.fetchurl {
    url = "https://i.redd.it/d6jjpbeaz3491.jpg";
    sha256 = "edcbb14b43975b5c7a5878155f8a9c18d3e8120588d530124c7cb633a9015195";
  };
in {
  enable = true;
  package = pkgs.i3-gaps;

  config = rec {
    modifier = "Mod4";
    terminal = "alacritty";
    window.border = 0;
    gaps = {
      inner = 20;
      outer = 5;
    };

    keybindings = lib.mkOptionDefault {
      "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
      "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
    };

    bars = [ ];
    startup = [
      {
        command = "systemctl --user restart polybar.service";
        always = true;
        notification = false;
      }
      {
        command = "${pkgs.feh}/bin/feh --bg-scale ${wallpaper}";
        always = true;
        notification = false;
      }
    ];
  };
}
