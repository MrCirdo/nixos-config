{...}: {
  home-manager.sharedModules = [
    (
      {
        pkgs,
        lib,
        config,
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
            enable = true;
            backgroundColor = config.theme.focusColor;
            borderColor = config.theme.focusColor2;
            defaultTimeout = 10000;
            borderRadius = 8;
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
                # command = "${pkgs.swaylock-effects}/bin/swaylock -f -C $HOME/.config/swaylock-effects/config; ${pkgs.sway}/bin/swaymsg output '*' dpms off";
                # resumeCommand = "${pkgs.sway}/bin/swaymsg output '*' dpms on";
              }
              (let
                suspendOrTurnOffScreen = pkgs.writeShellScriptBin "suspendOrTurnOffScreen.sh" ''
                  status_charging=$(cat /sys/class/power_supply/*/status)

                  if [ $status_charging = "Discharging" ];
                  then
                    echo "Discarging"
                    ${pkgs.systemd}/bin/systemctl suspend
                  else
                    echo "Charging"
                    # I comment this for later.
                    # wlroots bug, I disable this feature.
                    # I can't re-enable my screens after :)
                    # lol
                    # ${pkgs.sway}/bin/swaymsg output '*' dpms off
                  fi
                '';
              in {
                timeout = 360;
                command = "${suspendOrTurnOffScreen}/bin/suspendOrTurnOffScreen.sh";
                # resumeCommand = "${pkgs.sway}/bin/swaymsg output '*' dpms on";
              })
            ];
          };
        };
      }
    )
  ];
}
