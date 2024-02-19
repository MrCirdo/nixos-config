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
                modules-left = ["custom/launcher" "sway/workspaces"];
                modules-center = ["clock"];
                modules-right = [
                  "custom/rss"
                  "network"
                  "cpu"
                  "disk"
                  "memory"
                  "temperature"
                  "pulseaudio"
                  "battery"
                  "custom/powermenu"
                ];

                "sway/workspaces" = {
                };

                "custom/launcher" = {
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

                "custom/powermenu" = let
                  launchPowerMenu = pkgs.writeShellScriptBin "powerMenuWofi.sh" ''
                    menu=$(cat  <<EOF
                    1. Poweroff
                    2. Reboot
                    3. Hibernate
                    4. Hybrid Sleep
                    5. Suspend
                    6. Lock
                    EOF
                    )

                    choice=$(echo "$menu" | wofi --dmenu --location 3 --prompt "What do you want ?" --allow-markup --parse-search --width 200 --height 300)

                    case $choice in
                      "1. Poweroff")
                        systemctl poweroff
                        ;;
                      "2. Reboot")
                        systemctl reboot
                        ;;
                      "3. Hibernate")
                        systemctl hibernate
                        ;;
                      "4. Hybrid Sleep")
                        systemctl hybrid-sleep
                        ;;
                      "5. Suspend")
                        systemctl suspend
                        ;;
                      "6. Lock")
                        ${pkgs.swaylock-effects}/bin/swaylock -f -C $HOME/.config/swaylock-effects/config
                        ;;
                    esac
                  '';
                in {
                  format = "⏻";
                  on-click = "${launchPowerMenu}/bin/powerMenuWofi.sh";
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

                "custom/spotify" = {
                  format = " {}";
                  max-length = 100;
                  exec = "${pkgs.spotify-tui}/bin/spt playback -d \"NixSauce\"  -f \"%t - %a\"";
                  on-click = "${pkgs.spotify-tui}/bin/spt playback -d \"NixSauce\" -t";
                  on-click-right = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.spotify-tui}/bin/spt";
                  interval = 10;
                };

                "custom/spotify-next" = {
                  format = "";
                  interval = 10;
                  on-click = "${pkgs.spotify-tui}/bin/spt --next";
                  tooltip = false;
                };

                "custom/spotify-prev" = {
                  format = "";
                  interval = 10;
                  on-click = "${pkgs.spotify-tui}/bin/spt --previous";
                  tooltip = false;
                };
              }
            ];
          };
        };
      }
    )
  ];
}
