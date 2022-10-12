{ pkgs, lib, ... }:
let
  bg_0 = "1C1917";
  bg_1 = "292524";
  bg_2 = "44403C";
  dim_0 = "57534E";
  fg_0 = "57534E";
  fg_1 = "F5F5F4";

  red = "fa5750";
  green = "75b938";
  yellow = "dbb32d";
  blue = "164E63";
  magenta = "f275be";
  cyan = "41c7b9";
  orange = "ed8649";
  violet = "af88eb";

  br_red = "ff665c";
  br_green = "84c747";
  br_yellow = "ebc13d";
  br_blue = "58a3ff";
  br_magenta = "ff84cd";
  br_cyan = "53d6c7";
  br_orange = "fd9456";
  br_violet = "bd96fa";
in {
  enable = true;
  wrapperFeatures = {
    base = true;
    gtk = true;
  };

  config = rec {
    modifier = "Mod4";
    terminal = "alacritty";

    colors = {
      focused = {
        border = "#${blue}";
        background = "#${blue}";
        text = "#${fg_1}";
        indicator = "#${blue}";
        childBorder = "#${blue}";
      };
      focusedInactive = {
        border = "#${bg_1}";
        background = "#${bg_1}";
        text = "#${fg_0}";
        indicator = "#${bg_1}";
        childBorder = "#${bg_1}";
      };
      unfocused = {
        border = "#${bg_0}";
        background = "#${bg_0}";
        text = "#${dim_0}";
        indicator = "#${bg_0}";
        childBorder = "#${bg_0}";
      };
      urgent = {
        border = "#${red}";
        background = "#${red}";
        text = "#${fg_1}";
        indicator = "#${red}";
        childBorder = "#${red}";
      };
    };

    bars = [{
      statusCommand = "${pkgs.i3status}/bin/i3status";
      command = "${pkgs.sway}/bin/swaybar";
      colors = {
        background = "#${bg_0}";
        statusline = "#${fg_0}";
        separator = "#${fg_0}";
        focusedWorkspace = {
          border = "#${bg_1}";
          background = "#${blue}";
          text = "#${fg_1}";
        };
        activeWorkspace = {
          border = "#${bg_0}";
          background = "#${bg_1}";
          text = "#${fg_1}";
        };
        inactiveWorkspace = {
          border = "#${bg_0}";
          background = "#${bg_0}";
          text = "#${dim_0}";
        };
        urgentWorkspace = {
          border = "#${bg_1}";
          background = "#${red}";
          text = "#${fg_1}";
        };
      };
    }];

    workspaceAutoBackAndForth = true;

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
        bg = builtins.fetchurl {
          url = "https://i.redd.it/hv2q6ot89fl91.jpg";
          sha256 =
            "04d7d10145d235e42a4e9448dd3405ecc1cab0c20993a67cb28d18663b355696";
        } + " fill";
      };
      "eDP-1" = { scale = "2"; };
    };

    window.border = 0;

    gaps = {
      smartGaps = false;
      smartBorders = "on";
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
