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
          "cpu"
          "disk"
          "memory"
          "temperature"
          "pulseaudio"
          "clock"
          "battery"
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

        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            default = "";
            speaker = "";
            headphone = "";
          };
          scroll-step = 1;
          on-click = "pavucontrol";
        };
      }];
    };
  };
}
