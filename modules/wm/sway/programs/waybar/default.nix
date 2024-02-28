{config, ...}: let
  theme = config.theme;
in {
  home-manager.sharedModules = [
    (
      {
        pkgs,
        config,
        lib,
        inputs,
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
                  "mpris"
                  "custom/rss"
                  "network"
                  "cpu"
                  "memory"
                  "disk"
                  "temperature"
                  "pulseaudio"
                  "battery"
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

                clock = {format-alt = "{:%a, %d. %b  %H:%M}";};

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
                  on-click = "pavucontrol";
                };

                network = {
                  "format" = "{bandwidthUpBytes}   {bandwidthDownBytes} ";
                  "format-disconnected" = "󰖪";
                  "tooltip-format" = "{ipaddr}";
                  "tooltip-format-wifi" = "{ipaddr} | {essid} | ({signalStrength}%) ";
                  "tooltip-format-ethernet" = "{ipaddr}";
                  "tooltip-format-disconnected" = "Disconnected";
                  "max-length" = 50;
                  on-click = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.networkmanager}/bin/nmtui";
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
                  };
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

                "group/powermenu" = {
                  orientation = "inherit";
                  drawer = {
                    transition-duration = 200;
                    children-class = "not-power";
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
