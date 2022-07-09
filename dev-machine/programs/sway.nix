# Thanks to Tristan Floch for the config.
# https://github.com/TristanFloch/dotfiles-nix

{ pkgs, lib, ... }:

{
  enable = true;
  wrapperFeatures = {
    base = true;
    gtk = true;
  };

  config = rec {
    modifier = "Mod4";
    terminal = "alacritty";
    bars = [ ];
    workspaceAutoBackAndForth = true;
    seat = { "*" = { xcursor_theme = "Dracula-cursors 16"; }; };

    input = {
      "type:keyboard" = {
        repeat_delay = "150";
        repeat_rate = "40";
        xkb_options = "caps:escape";
        #xkb_layout = "fr,us";
        xkb_layout = "us";
        #xkb_variant = "mac,intl";
        xkb_variant = "intl";
      };
    };

    output = {
      "*" = {
        bg = builtins.fetchurl
          {
            url = "https://i.redd.it/9lbwxdoirk891.png";
            sha256 = "51447000dff937658a4380e6c79bdfd23f12f1730cc146b97bcea18d0756c1bc";
          } + " fill";
      };
      "eDP-1" = {
        scale = "2";
      };
    };

    window.border = 0;

    gaps = {
      inner = 10;
      outer = 5;
      smartGaps = false;
      smartBorders = "on";
    };

    colors = {
      focused = { border = "#6272A4"; background = "#6272A4"; text = "#F8F8F2"; indicator = "#6272A4"; childBorder = "#6272A4"; };
      focusedInactive = { border = "#44475A"; background = "#44475A"; text = "#F8F8F2"; indicator = "#44475A"; childBorder = "#44475A"; };
      unfocused = { border = "#282A36"; background = "#282A36"; text = "#BFBFBF"; indicator = "#282A36"; childBorder = "#282A36"; };
      urgent = { border = "#44475A"; background = "#FF5555"; text = "#F8F8F2"; indicator = "#FF5555"; childBorder = "#FF5555"; };
      placeholder = { border = "#282A36"; background = "#282A36"; text = "#F8F8F2"; indicator = "#282A36"; childBorder = "#282A36"; };
      background = "#F8F8F2";
    };

    keybindings = lib.mkOptionDefault {
      "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
      "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
    };

  };

  extraSessionCommands = ''
    export SDL_VIDEODRIVER=wayland
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    export _JAVA_AWT_WM_NONREPARENTING=1
    export MOZ_ENABLE_WAYLAND=1
  '';
}
