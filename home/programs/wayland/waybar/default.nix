{
  pkgs,
  config,
  ...
}: let
  theme = config.theme;
in {
  programs = {
    waybar = {
      enable = true;
      style = import ./style.nix {inherit theme;};
      settings = [
        {
          layer = "top";
          modules-left = ["sway/workspaces" "sway/mode"];
          modules-center = ["sway/window"];
          modules-right = [
            "cpu"
            "disk"
            "memory"
            "temperature"
            "pulseaudio"
            "custom/spotify-prev"
            "custom/spotify"
            "custom/spotify-next"
            "clock"
            "battery"
          ];

          battery = {
            format = "{capacity}% {icon}";
            format-icons = ["" "" "" "" ""];
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
            on-click-right = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.htop}/bin/htop";
          };

          clock = {format-alt = "{:%a, %d. %b  %H:%M} ";};

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

          "custom/spotify" = let
            mediaPlayer = pkgs.callPackage ./mediaplayer {};
          in {
            format = "";
            max-length = 35;
            exec = "${mediaPlayer}/bin/mediaplayer.py 2> /dev/null";
            exec-if = "${pkgs.procps} spotify";
            return-type = "json";

            on-scroll-up = "${pkgs.playerctl}/bin/playerctl --player=spotify position 5+";
            on-scroll-down = "${pkgs.playerctl}/bin/playerctl --player=spotify position 5-";
            on-click = "${pkgs.playerctl}/bin/playerctl --player=spotify play-pause";
            on-click-right = "${pkgs.sway}/bin/swaymsg [class=Spotify] focus";
          };

          "custom/spotify-next" = {
            format = "{}";
            interval = 10;
            exec = "echo "; # ﭡ
            exec-if = "${pkgs.procps}/bin/pgrep spotify";
            on-click = "${pkgs.playerctl}/bin/playerctl --player=spotify next";
            tooltip = false;
          };

          "custom/spotify-prev" = {
            format = "{}";
            interval = 10;
            exec = "echo "; # ﭣ
            exec-if = "${pkgs.procps}/bin/pgrep spotify";
            on-click = "${pkgs.playerctl}/bin/playerctl  --player=spotify previous";
            tooltip = false;
          };
        }
      ];
    };
  };
}
