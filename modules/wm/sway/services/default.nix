{
  lib,
  config,
  ...
}: {
  services = lib.mkIf config.sway.enable {
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      };
    };
  };
  home-manager.sharedModules = [
    (
      {
        pkgs,
        lib,
        config,
        theme,
        ...
      }: {
        services = lib.mkIf config.sway.enable {
          gammastep = {
            enable = true;
            dawnTime = "8:00";
            duskTime = "22:00";
            temperature.night = 2500;
          };

          mako = {
            enable = false;
            backgroundColor = theme.backgroundColor;
            borderColor = theme.backgroundColor2;
            textColor = theme.textColor;
            defaultTimeout = 10000;
            borderRadius = 20;
          };

          swaync = {
            enable = true;
            settings = {
              positionX = "right";
              positionY = "top";
              control-center-positionX = "none";
              control-center-positionY = "none";
              control-center-margin-top = 8;
              control-center-margin-bottom = 8;
              control-center-margin-right = 8;
              control-center-margin-left = 8;
              control-center-width = 500;
              control-center-height = 600;
              fit-to-screen = true;

              layer-shell = true;
              layer = "overlay";
              control-center-layer = "overlay";
              notification-icon-size = 64;
              notification-body-image-height = 100;
              notification-body-image-width = 200;
              notification-inline-replies = true;
              timeout = 10;
              timeout-low = 5;
              timeout-critical = 0;
              notification-window-width = 500;
              keyboard-shortcuts = true;
              image-visibility = "always";
              transition-time = 200;
              hide-on-clear = true;
              hide-on-action = true;
              script-fail-notify = true;

              widgets = [
                "inhibitors"
                "dnd"
                "mpris"
                "notifications"
              ];

              widget-config = {
                inhibitors = {
                  text = "Inhibitors";
                  button-text = "Clear All";
                  clear-all-button = true;
                };
                title = {
                  text = "Notifications";
                  clear-all-button = false;
                  button-text = "Clear All";
                };
                dnd = {
                  "text" = "Do Not Disturb";
                };
                label = {
                  max-lines = 5;
                  text = "Label Text";
                };
                mpris = {
                  image-size = 96;
                  blur = true;
                };
              };
            };

            style = ''
              @define-color cc-bg ${theme.backgroundColor};

              @define-color noti-border-color ${theme.backgroundColor2};

              @define-color noti-bg ${theme.backgroundColor2};
              @define-color noti-bg-opaque ${theme.backgroundColor2};
              @define-color noti-bg-darker ${theme.backgroundColor};
              @define-color noti-bg-hover ${theme.backgroundColor3};
              @define-color noti-bg-hover-opaque ${theme.backgroundColor3};
              @define-color noti-bg-focus ${theme.backgroundColor3};
              @define-color noti-close-bg ${theme.backgroundColor};
              @define-color noti-close-bg-hover ${theme.backgroundColor2};

              @define-color text-color ${theme.textColor};
              @define-color text-color-disabled ${theme.textColor3};

              @define-color bg-selected ${theme.focusColor};
            '';
          };

          swayidle = {
            enable = true;
            events = [
              {
                event = "before-sleep";
                command = "${pkgs.swaylock-effects}/bin/swaylock -f -C /home/odric/.config/swaylock-effects/config";
              }
            ];
            timeouts = [
              {
                timeout = 300;
                command = "${pkgs.swaylock-effects}/bin/swaylock -f -C $HOME/.config/swaylock-effects/config";
              }
              {
                timeout = 360;
                command = "${pkgs.sway}/bin/swaymsg output '*' dpms off";
                resumeCommand = "${pkgs.sway}/bin/swaymsg output '*' dpms on";
              }
            ];
          };
        };
      }
    )
  ];
}
