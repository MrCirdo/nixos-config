{ pkgs, ... }:

{

  programs = {
    waybar = {
      enable = true;
      style = ./style.css;
      settings = [{
        layer = "top";
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "sway/window" ];
        modules-right = [
          "tray"
          "cpu"
          "disk"
          "memory"
          "temperature"
          "clock"
          "battery"
          "wlr/taskbar"
        ];

        battery = {
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
          states = {
            warning = 25;
            critical = 10;
          };

          full-at = 69; # Lol
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        cpu = {
          format = "{usage}% ";
          on-click-right =
            "${pkgs.alacritty}/bin/alacritty -e ${pkgs.htop}/bin/htop";
        };

        clock = { format-alt = "{:%a, %d. %b  %H:%M} "; };

        disk = {
          interval = 30;
          format = "{free} ";
          tooltip-format = "{used} out of {total} used ({percentage_used}%)";
          path = "/";
        };

        temperature = {
          critical-threshold = 80;
          tooltip = false;
          format = "{temperatureC} 糖";
        };

        memory = {
          format = "{used:0.1f}GiB ";
          tooltip-format = "{used:0.1f}GiB / {total:0.1f}GiB used";
        };

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 15;
          icon-theme = "Numix-Circle";
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [ "Alacritty" "firefox" "code" ];
          "app_ids-mapping" = {
            "firefoxdeveloperedition" = "firefox-developer-edition";
          };
        };

      }];
    };
  };
}
