{...}: {
  home-manager.sharedModules = [
    (
      {
        pkgs,
        config,
        lib,
        inputs,
        theme,
        ...
      }: {
        programs = lib.mkIf config.sway.enable {
          waybar = {
            enable = true;
            style = import ./style.nix {inherit theme;};
            settings = [
              {
                layer = "top";
                modules-left = ["custom/nixos" "sway/workspaces"];
                modules-center = ["clock"];
                modules-right = [
                  "custom/notification"
                  "mpris"
                  "group/trays"
                  "custom/rss"
                  "network"
                  "cpu"
                  "memory"
                  "disk"
                  "temperature"
                  "pulseaudio"
                  "battery"
                  "custom/begin"
                  "group/powermenu"
                ];

                "sway/workspaces" = {
                };

                "custom/nixos" = {
                  "format" = " ";
                  "tooltip" = false;
                };

                battery = {
                  format = "{capacity}% {icon}";
                  format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁"];
                  format-full = "󰂄";
                  states = {
                    warning = 25;
                    critical = 10;
                  };
                };

                tray = {
                  icon-size = 21;
                  spacing = 10;
                };

                cpu = {
                  format = "{usage}% ";
                  on-click-right = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.btop}/bin/btop";
                };

                clock = {
                  format-alt = "󰥔 {:%a, %d. %b  %H:%M}";
                  format = "󰥔 {:%H:%M}";
                };

                disk = {
                  interval = 30;
                  format = "{free} ";
                  tooltip-format = "{used} out of {total} used ({percentage_used}%)";
                  path = "/";
                };

                temperature = {
                  critical-threshold = 80;
                  tooltip = false;
                  format = "{temperatureC} 󰔄";
                };

                memory = {
                  format = "{used:0.1f}GiB ";
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
                  on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
                  on-click-right = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.bluetuith}/bin/bluetuith";
                };

                network = {
                  "format" = "{bandwidthUpBytes}   {bandwidthDownBytes} ";
                  "format-disconnected" = "󰖪";
                  "tooltip-format" = "{ipaddr}";
                  "tooltip-format-wifi" = "{ipaddr} | {essid} | ({signalStrength}%) ";
                  "tooltip-format-ethernet" = "{ipaddr}";
                  "tooltip-format-disconnected" = "Disconnected";
                  "max-length" = 50;
                  on-click = let
                    launchNmtui = pkgs.writeShellScriptBin "launch_nmtui.sh" ''
                      ${pkgs.coreutils}/bin/sleep 0.1
                      ${pkgs.networkmanager}/bin/nmtui
                    '';
                  in "${pkgs.alacritty}/bin/alacritty -e ${launchNmtui}/bin/launch_nmtui.sh";
                };

                mpris = {
                  format = "{player_icon} {status_icon}";
                  player-icons = {
                    default = "󰝚";
                    spotify = "";
                    firefox = "󰈹";
                  };
                  status-icons = {
                    paused = "";
                    playing = "⏸";
                    stopped = "";
                  };
                };
                "custom/notification" = {
                  tooltip = false;
                  format = "{icon}";
                  format-icons = {
                    notification = "<span foreground='red'><sup></sup></span>";
                    none = "";
                    dnd-notification = "<span foreground='red'><sup></sup></span>";
                    dnd-none = "";
                    inhibited-notification = "<span foreground='red'><sup></sup></span>";
                    inhibited-none = "";
                    dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
                    dnd-inhibited-none = "";
                  };
                  return-type = "json";
                  exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
                  on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
                  on-click-right = "s${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
                  escape = true;
                };

                "custom/lock" = {
                  format = "󰍁";
                  tooltip = true;
                  tooltip-format = "󰍁 Lock...";
                  on-click = "${pkgs.swaylock-effects}/bin/swaylock -C $HOME/.config/swaylock-effects/config";
                };

                "custom/reboot" = {
                  format = "󰜉";
                  tooltip = true;
                  tooltip-format = "󰜉 Reboot...";
                  on-click = "${pkgs.systemd}/bin/systemctl reboot";
                };

                "custom/poweroff" = {
                  format = "⏻";
                  tooltip = true;
                  tooltip-format = "⏻ Shutdown...";
                  on-click = "${pkgs.systemd}/bin/systemctl poweroff";
                };

                "custom/sleep" = {
                  format = "";
                  tooltip = true;
                  tooltip-format = " Suspend...";
                  on-click = "${pkgs.systemd}/bin/systemctl suspend";
                };

                "custom/hibernation" = {
                  format = "󰒲";
                  tooltip = true;
                  tooltip-format = "󰒲 Hibernate...";
                  on-click = "${pkgs.systemd}/bin/systemctl hibernate";
                };

                "custom/begin" = {
                  format = " ";
                  tooltip = false;
                };

                "group/powermenu" = {
                  orientation = "inherit";
                  drawer = {
                    transition-duration = 200;
                    transition-left-to-right = false;
                  };
                  modules = [
                    "custom/poweroff"
                    "custom/hibernation"
                    "custom/sleep"
                    "custom/lock"
                    "custom/reboot"
                  ];
                };

                "custom/tray-icon" = {
                  format = "󰵆";
                  tooltip = true;
                  tooltip-format = "󰵆 Trays icons...";
                };

                "group/trays" = {
                  orientation = "inherit";
                  drawer = {
                    transition-duration = 200;
                    transition-left-to-right = false;
                  };
                  modules = [
                    "custom/tray-icon"
                    "custom/space-tray"
                    "tray"
                    "custom/space-tray"
                  ];
                };

                "custom/space-tray" = {
                  format = " ";
                };

                "custom/rss" = let
                  launchNewsBoat = pkgs.writeShellScriptBin "launch_newsboat.sh" ''
                    while rt=`${pkgs.procps}/bin/pgrep -x "newsboat"` && [[ "$rt" -gt 0 ]]; do :; done;
                    ${pkgs.alacritty}/bin/alacritty -e ${pkgs.newsboat}/bin/newsboat
                  '';
                in {
                  format = "{} ";
                  exec = "${pkgs.newsboat}/bin/newsboat -x reload print-unread | ${pkgs.coreutils}/bin/cut -d ' ' -f 1";
                  interval = 600; # 10 minutes
                  on-click = "${launchNewsBoat}/bin/launch_newsboat.sh";
                  output = ["eDP-1"];
                };
              }
            ];
          };
        };
      }
    )
  ];
}
