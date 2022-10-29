{ pkgs, lib, config, ... }:
let
  default_config = config.wayland.windowManager.sway.config;

  bg_0 = "1C1917";
  bg_1 = "292524";
  bg_2 = "44403C";
  dim_0 = "57534E";
  fg_0 = "57534E";
  fg_1 = "F5F5F4";

  red = "fa5750";
  green = "75b938";
  yellow = "dbb32d";
  blue = "1E3A8A";
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
  wayland.windowManager.sway = {
    enable = true;

    wrapperFeatures = {
      base = true;
      gtk = true;
    };

    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";

      keybindings = {
        "${default_config.modifier}+Return" = "exec ${default_config.terminal}";
        "${default_config.modifier}+Shift+q" = "kill";
        "${default_config.modifier}+d" = "exec ${default_config.menu}";

        "${default_config.modifier}+${default_config.left}" = "focus left";
        "${default_config.modifier}+${default_config.down}" = "focus down";
        "${default_config.modifier}+${default_config.up}" = "focus up";
        "${default_config.modifier}+${default_config.right}" = "focus right";

        "${default_config.modifier}+Left" = "focus left";
        "${default_config.modifier}+Down" = "focus down";
        "${default_config.modifier}+Up" = "focus up";
        "${default_config.modifier}+Right" = "focus right";

        "${default_config.modifier}+Shift+${default_config.left}" = "move left";
        "${default_config.modifier}+Shift+${default_config.down}" = "move down";
        "${default_config.modifier}+Shift+${default_config.up}" = "move up";
        "${default_config.modifier}+Shift+${default_config.right}" =
          "move right";

        "${default_config.modifier}+Shift+Left" = "move left";
        "${default_config.modifier}+Shift+Down" = "move down";
        "${default_config.modifier}+Shift+Up" = "move up";
        "${default_config.modifier}+Shift+Right" = "move right";

        "${default_config.modifier}+b" = "splith";
        "${default_config.modifier}+v" = "splitv";
        "${default_config.modifier}+f" = "fullscreen toggle";
        "${default_config.modifier}+a" = "focus parent";

        "${default_config.modifier}+s" = "layout stacking";
        "${default_config.modifier}+w" = "layout tabbed";
        "${default_config.modifier}+e" = "layout toggle split";

        "${default_config.modifier}+Shift+space" = "floating toggle";
        "${default_config.modifier}+space" = "focus mode_toggle";

        "${default_config.modifier}+1" = "workspace number 1";
        "${default_config.modifier}+2" = "workspace number 2";
        "${default_config.modifier}+3" = "workspace number 3";
        "${default_config.modifier}+4" = "workspace number 4";
        "${default_config.modifier}+5" = "workspace number 5";
        "${default_config.modifier}+6" = "workspace number 6";
        "${default_config.modifier}+7" = "workspace number 7";
        "${default_config.modifier}+8" = "workspace number 8";
        "${default_config.modifier}+9" = "workspace number 9";

        "${default_config.modifier}+Alt+1" =
          "move container to workspace number 1";
        "${default_config.modifier}+Alt+2" =
          "move container to workspace number 2";
        "${default_config.modifier}+Alt+3" =
          "move container to workspace number 3";
        "${default_config.modifier}+Alt+4" =
          "move container to workspace number 4";
        "${default_config.modifier}+Alt+5" =
          "move container to workspace number 5";
        "${default_config.modifier}+Alt+6" =
          "move container to workspace number 6";
        "${default_config.modifier}+Alt+7" =
          "move container to workspace number 7";
        "${default_config.modifier}+Alt+8" =
          "move container to workspace number 8";
        "${default_config.modifier}+Alt+9" =
          "move container to workspace number 9";

        "${default_config.modifier}+Shift+minus" = "move scratchpad";
        "${default_config.modifier}+minus" = "scratchpad show";

        "${default_config.modifier}+Shift+c" = "reload";
        "${default_config.modifier}+Shift+e" =
          "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

        "${default_config.modifier}+r" = "mode resize";
        "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 3";
        "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 3";
      };

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
        "1452:627:Apple_Inc._Apple_Internal_Keyboard_/_Trackpad" = {
          repeat_delay = "150";
          repeat_rate = "40";
          xkb_options = "caps:escape";
          xkb_layout = "fr";
          xkb_variant = "mac";
        };

        "2385:5842:Kingston_HyperX_Alloy_FPS_Pro_Mechanical_Gaming_Keyboard" = {
          repeat_delay = "150";
          repeat_rate = "40";
          xkb_options = "caps:escape";
          xkb_layout = "us";
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
  };
}
