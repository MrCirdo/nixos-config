{
  pkgs,
  lib,
  config,
  ...
}: let
  defaultConfig = config.wayland.windowManager.sway.config;
  theme = config.theme;
  defaultSinkPulseaudio = "@DEFAULT_SINK@";
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

      fonts = {
        names = ["Ubuntu"];
        size = 12.0;
      };

      keybindings = {
        "${defaultConfig.modifier}+Return" = "exec ${defaultConfig.terminal}";
        "${defaultConfig.modifier}+Shift+q" = "kill";
        "${defaultConfig.modifier}+d" = "exec ${pkgs.wofi}/bin/wofi --show=drun";
        "${defaultConfig.modifier}+Shift+d" = "exec ${pkgs.wofi}/bin/wofi --show=run";

        "${defaultConfig.modifier}+${defaultConfig.left}" = "focus left";
        "${defaultConfig.modifier}+${defaultConfig.down}" = "focus down";
        "${defaultConfig.modifier}+${defaultConfig.up}" = "focus up";
        "${defaultConfig.modifier}+${defaultConfig.right}" = "focus right";

        "${defaultConfig.modifier}+Left" = "focus left";
        "${defaultConfig.modifier}+Down" = "focus down";
        "${defaultConfig.modifier}+Up" = "focus up";
        "${defaultConfig.modifier}+Right" = "focus right";

        "${defaultConfig.modifier}+Shift+${defaultConfig.left}" = "move left";
        "${defaultConfig.modifier}+Shift+${defaultConfig.down}" = "move down";
        "${defaultConfig.modifier}+Shift+${defaultConfig.up}" = "move up";
        "${defaultConfig.modifier}+Shift+${defaultConfig.right}" = "move right";

        "${defaultConfig.modifier}+Shift+Left" = "move left";
        "${defaultConfig.modifier}+Shift+Down" = "move down";
        "${defaultConfig.modifier}+Shift+Up" = "move up";
        "${defaultConfig.modifier}+Shift+Right" = "move right";

        "${defaultConfig.modifier}+b" = "splith";
        "${defaultConfig.modifier}+v" = "splitv";
        "${defaultConfig.modifier}+f" = "fullscreen toggle";
        "${defaultConfig.modifier}+a" = "focus parent";

        "${defaultConfig.modifier}+s" = "layout stacking";
        "${defaultConfig.modifier}+w" = "layout tabbed";
        "${defaultConfig.modifier}+e" = "layout toggle split";

        "${defaultConfig.modifier}+Shift+space" = "floating toggle";
        "${defaultConfig.modifier}+space" = "focus mode_toggle";

        "${defaultConfig.modifier}+1" = "workspace number 1";
        "${defaultConfig.modifier}+2" = "workspace number 2";
        "${defaultConfig.modifier}+3" = "workspace number 3";
        "${defaultConfig.modifier}+4" = "workspace number 4";
        "${defaultConfig.modifier}+5" = "workspace number 5";
        "${defaultConfig.modifier}+6" = "workspace number 6";
        "${defaultConfig.modifier}+7" = "workspace number 7";
        "${defaultConfig.modifier}+8" = "workspace number 8";
        "${defaultConfig.modifier}+9" = "workspace number 9";

        "${defaultConfig.modifier}+Alt+1" = "move container to workspace number 1";
        "${defaultConfig.modifier}+Alt+2" = "move container to workspace number 2";
        "${defaultConfig.modifier}+Alt+3" = "move container to workspace number 3";
        "${defaultConfig.modifier}+Alt+4" = "move container to workspace number 4";
        "${defaultConfig.modifier}+Alt+5" = "move container to workspace number 5";
        "${defaultConfig.modifier}+Alt+6" = "move container to workspace number 6";
        "${defaultConfig.modifier}+Alt+7" = "move container to workspace number 7";
        "${defaultConfig.modifier}+Alt+8" = "move container to workspace number 8";
        "${defaultConfig.modifier}+Alt+9" = "move container to workspace number 9";

        "${defaultConfig.modifier}+Shift+minus" = "move scratchpad";
        "${defaultConfig.modifier}+minus" = "scratchpad show";

        "${defaultConfig.modifier}+Shift+c" = "reload";
        "${defaultConfig.modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

        "${defaultConfig.modifier}+r" = "mode resize";
        "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 3";
        "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 3";

        "F2" = "exec ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy --type 'image/png'";
        "F3" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\"  - | ${pkgs.wl-clipboard}/bin/wl-copy --type 'image/png'";

        "${defaultConfig.modifier}+Alt+l" = "exec ${pkgs.swaylock-effects}/bin/swaylock -C $HOME/.config/swaylock-effects/config";
        "${defaultConfig.modifier}+Alt+Shift+h" = "exec ${pkgs.swaylock-effects}/bin/swaylock -f -C $HOME/.config/swaylock-effects/config && sleep 2 && systemctl hybrid-sleep";
        "${defaultConfig.modifier}+Alt+Shift+s" = "exec ${pkgs.swaylock-effects}/bin/swaylock -f -C $HOME/.config/swaylock-effects/config && sleep 2 && systemctl suspend";

        "XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume ${defaultSinkPulseaudio} +10%";
        "XF86AudioMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute ${defaultSinkPulseaudio} toggle";
        "XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume ${defaultSinkPulseaudio} -10%";

        "Shift+XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume ${defaultSinkPulseaudio} +1%";
        "Shift+XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume ${defaultSinkPulseaudio} -1%";
      };

      colors = {
        focused = {
          border = "${theme.focusColor}";
          background = "${theme.focusColor}";
          text = "${theme.textColor}";
          indicator = "${theme.focusColor}";
          childBorder = "${theme.focusColor}";
        };
        focusedInactive = {
          border = "${theme.backgroundColor2}";
          background = "${theme.backgroundColor2}";
          text = "${theme.textColor2}";
          indicator = "${theme.backgroundColor2}";
          childBorder = "${theme.backgroundColor2}";
        };
        unfocused = {
          border = "${theme.backgroundColor3}";
          background = "${theme.backgroundColor3}";
          text = "${theme.textColor3}";
          indicator = "${theme.backgroundColor3}";
          childBorder = "${theme.backgroundColor3}";
        };
        urgent = {
          border = "${theme.alertColor}";
          background = "${theme.alertColor}";
          text = "${theme.textColor}";
          indicator = "${theme.alertColor}";
          childBorder = "${theme.alertColor}";
        };
      };

      bars = [{command = "${pkgs.waybar}/bin/waybar";}];

      workspaceAutoBackAndForth = true;

      input = {
        "1452:627:Apple_Inc._Apple_Internal_Keyboard_/_Trackpad" = {
          repeat_delay = "200";
          repeat_rate = "75";
          xkb_options = "caps:escape";
          xkb_layout = "fr";
          xkb_variant = "mac";
        };

        "2385:5842:Kingston_HyperX_Alloy_FPS_Pro_Mechanical_Gaming_Keyboard" = {
          repeat_delay = "200";
          repeat_rate = "75";
          xkb_options = "caps:escape";
          xkb_layout = "us";
          xkb_variant = "intl";
        };
      };

      output = {
        "*" = {
          bg =
            builtins.fetchurl {
              url = "https://i.redd.it/gayvb53tnjx91.png";
              sha256 = "55f3f11decab62d4171cd19688ca5aa446ac7c63cc4a56cf379cfa9ae05d570e";
            }
            + " fill";
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
      export _JAVA_AWT_WM_NONREPARENTING=1
      export QT_QPA_PLATFORM=wayland
      export XDG_CURRENT_DESKTOP=sway
      export XDG_SESSION_DESKTOP=sway
      export MOZ_ENABLE_WAYLAND=1
    '';
  };
}
