{...}: {
  home-manager.sharedModules = [
    ({
      pkgs,
      lib,
      config,
      theme,
      ...
    }: let
      defaultConfig = config.wayland.windowManager.sway.config;
      defaultSinkPulseaudio = "@DEFAULT_SINK@";
    in {
      wayland.windowManager.sway = lib.mkIf config.sway.enable {
        enable = true;
        package = pkgs.swayfx;
        checkConfig = false;

        wrapperFeatures = {
          base = true;
          gtk = true;
        };

        extraConfig = ''
          blur disable
          corner_radius 8
          smart_corner_radius on

          for_window [app_id="codium-url-handler"] opacity 0.9
          for_window [app_id="discord"] opacity 0.9
          for_window [app_id="Alacritty"] blur enable

          for_window [class=".*"] inhibit_idle fullscreen
          for_window [app_id=".*"] inhibit_idle fullscreen
        '';

        config = rec {
          modifier = "Mod4";
          terminal = "alacritty";

          fonts = {
            names = ["Souce Code Pro"];
            size = 12.0;
          };

          startup = [
            {
              command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            }
            {
              command = "exec ${pkgs.swaysome}/bin/swaysome init 1";
            }
          ];

          keybindings = {
            "${defaultConfig.modifier}+Return" = "exec ${defaultConfig.terminal}";
            "${defaultConfig.modifier}+Shift+q" = "kill";
            "${defaultConfig.modifier}+d" = "exec ${pkgs.wofi}/bin/wofi --show=drun";
            "${defaultConfig.modifier}+Shift+d" = "exec ${pkgs.nix}/bin/nix run nixpkgs#$(${pkgs.wofi}/bin/wofi --dmenu)";

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

            "${defaultConfig.modifier}+1" = "exec ${pkgs.swaysome}/bin/swaysome focus 1";
            "${defaultConfig.modifier}+2" = "exec ${pkgs.swaysome}/bin/swaysome focus 2";
            "${defaultConfig.modifier}+3" = "exec ${pkgs.swaysome}/bin/swaysome focus 3";
            "${defaultConfig.modifier}+4" = "exec ${pkgs.swaysome}/bin/swaysome focus 4";
            "${defaultConfig.modifier}+5" = "exec ${pkgs.swaysome}/bin/swaysome focus 5";
            "${defaultConfig.modifier}+6" = "exec ${pkgs.swaysome}/bin/swaysome focus 6";
            "${defaultConfig.modifier}+7" = "exec ${pkgs.swaysome}/bin/swaysome focus 7";
            "${defaultConfig.modifier}+8" = "exec ${pkgs.swaysome}/bin/swaysome focus 8";
            "${defaultConfig.modifier}+9" = "exec ${pkgs.swaysome}/bin/swaysome focus 9";
            "${defaultConfig.modifier}+0" = "exec ${pkgs.swaysome}/bin/swaysome focus 0";

            "${defaultConfig.modifier}+Shift+1" = "exec ${pkgs.swaysome}/bin/swaysome move 1";
            "${defaultConfig.modifier}+Shift+2" = "exec ${pkgs.swaysome}/bin/swaysome move 2";
            "${defaultConfig.modifier}+Shift+3" = "exec ${pkgs.swaysome}/bin/swaysome move 3";
            "${defaultConfig.modifier}+Shift+4" = "exec ${pkgs.swaysome}/bin/swaysome move 4";
            "${defaultConfig.modifier}+Shift+5" = "exec ${pkgs.swaysome}/bin/swaysome move 5";
            "${defaultConfig.modifier}+Shift+6" = "exec ${pkgs.swaysome}/bin/swaysome move 6";
            "${defaultConfig.modifier}+Shift+7" = "exec ${pkgs.swaysome}/bin/swaysome move 7";
            "${defaultConfig.modifier}+Shift+8" = "exec ${pkgs.swaysome}/bin/swaysome move 8";
            "${defaultConfig.modifier}+Shift+9" = "exec ${pkgs.swaysome}/bin/swaysome move 9";
            "${defaultConfig.modifier}+Shift+0" = "exec ${pkgs.swaysome}/bin/swaysome move 0";

            "Alt+1" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 1";
            "Alt+2" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 2";
            "Alt+3" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 3";
            "Alt+4" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 4";
            "Alt+5" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 5";
            "Alt+6" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 6";
            "Alt+7" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 7";
            "Alt+8" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 8";
            "Alt+9" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 9";
            "Alt+0" = "exec ${pkgs.swaysome}/bin/swaysome focus-group 0";

            # Move containers to other workspace groups
            "Alt+Shift+1" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 1";
            "Alt+Shift+2" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 2";
            "Alt+Shift+3" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 3";
            "Alt+Shift+4" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 4";
            "Alt+Shift+5" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 5";
            "Alt+Shift+6" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 6";
            "Alt+Shift+7" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 7";
            "Alt+Shift+8" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 8";
            "Alt+Shift+9" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 9";
            "Alt+Shift+0" = "exec ${pkgs.swaysome}/bin/swaysome move-to-group 0";

            # Move focused container to next output
            "${defaultConfig.modifier}+o" = "exec ${pkgs.swaysome}/bin/swaysome next-output";
            # Move focused container to previous output
            "${defaultConfig.modifier}+Shift+o" = "exec ${pkgs.swaysome}/bin/swaysome prev-output";

            # Move focused workspace group to next output
            "${defaultConfig.modifier}+Alt+o" = "exec ${pkgs.swaysome}/bin/swaysome workspace-group-next-output";
            # Move focused workspace group to previous output
            "${defaultConfig.modifier}+Alt+Shift+o" = "exec ${pkgs.swaysome}/bin/swaysome workspace-group-prev-output";
            "${defaultConfig.modifier}+Shift+minus" = "move scratchpad";
            "${defaultConfig.modifier}+minus" = "scratchpad show";

            "${defaultConfig.modifier}+Shift+c" = "reload";
            "${defaultConfig.modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

            "${defaultConfig.modifier}+r" = "mode resize";

            "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 3";
            "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 3";
            "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
            "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
            "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";

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
              border = "${theme.backgroundColor}";
              background = "${theme.backgroundColor}";
              text = "${theme.textColor2}";
              indicator = "${theme.backgroundColor}";
              childBorder = "${theme.backgroundColor}";
            };
            unfocused = {
              border = "${theme.backgroundColor}";
              background = "${theme.backgroundColor}";
              text = "${theme.textColor2}";
              indicator = "${theme.backgroundColor}";
              childBorder = "${theme.backgroundColor}";
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

            "1:1:AT_Translated_Set_2_keyboard" = {
              repeat_delay = "200";
              repeat_rate = "75";
              xkb_options = "caps:escape";
              xkb_layout = "us";
              xkb_variant = "intl";
            };

            "2385:5842:Kingston_HyperX_Alloy_FPS_Pro_Mechanical_Gaming_Keyboard" = {
              repeat_delay = "200";
              repeat_rate = "75";
              xkb_options = "caps:escape";
              xkb_layout = "us";
              xkb_variant = "intl";
            };

            "1133:16522:Logitech_Wireless_Device_PID:408a" = {
              repeat_delay = "200";
              repeat_rate = "75";
              xkb_options = "caps:escape";
              xkb_layout = "us";
              xkb_variant = "intl";
            };

            "1133:16522:Logitech_Wireless_Keyboard_PID:408a" = {
              repeat_delay = "200";
              repeat_rate = "75";
              xkb_options = "caps:escape";
              xkb_layout = "us";
              xkb_variant = "intl";
            };

            "1133:45915:MX_Keys_Keyboard" = {
              repeat_delay = "200";
              repeat_rate = "75";
              xkb_options = "caps:escape";
              xkb_layout = "us";
              xkb_variant = "intl";
            };

            "1133:16522:Logitech_MX_Keys" = {
              repeat_delay = "200";
              repeat_rate = "75";
              xkb_options = "caps:escape";
              xkb_layout = "us";
              xkb_variant = "intl";
            };

            "1133:49948:Logitech_USB_Keyboard" = {
              repeat_delay = "200";
              repeat_rate = "75";
              xkb_options = "caps:escape";
              xkb_layout = "us";
              xkb_variant = "intl";
            };

            "1267:12572:DELL097D:00_04F3:311C_Touchpad" = {
              scroll_method = "two_finger";
              tap_button_map = "lrm";
              tap = "enabled";
            };

            "1739:52934:SYNA801A:00_06CB:CEC6_Touchpad" = {
              scroll_method = "two_finger";
              tap_button_map = "lrm";
              tap = "enabled";
            };

            "1739:52990:SYNA2BA6:00_06CB:CEFE_Touchpad" = {
              scroll_method = "two_finger";
              tap_button_map = "lrm";
              tap = "enabled";
            };

            "12538:1024:USB_Optical_Mouse" = {
              pointer_accel = "-0.5";
            };
          };

          output = {
            "*" = {
              adaptive_sync = "on";
              bg =
                "${theme.wallpaper}" + " fill";
            };

            "DP-4" = {
              scale = "1";
            };
            "DP-5" = {
              scale = "1";
            };
            "HDMI-A-1" = {
              scale = "1.50";
            };
          };

          window = {
            border = 1;
            titlebar = false;
          };

          gaps = {
            smartBorders = "on";
            inner = 10;
            outer = 5;
          };
        };

      };
    })
  ];
}
