{
  lib,
  config,
  ...
}: {
  services = lib.mkIf config.sway.enable {
    tlp.enable = true;
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
            enable = true;
            backgroundColor = theme.backgroundColor;
            borderColor = theme.backgroundColor2;
            textColor = theme.textColor;
            defaultTimeout = 10000;
            borderRadius = 20;
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
