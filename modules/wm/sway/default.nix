{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    sway = {
      enable = lib.mkEnableOption "Enable Sway";
    };
  };

  config = let
    launchSway =
      pkgs.writeShellScriptBin "launch_sway.sh"
      ''
        exec ${pkgs.sway}/bin/sway
      '';
  in
    # The goal is if sway is enabled.
    # The option in module manager must be actived.
    with lib;
      mkMerge [
        {
          home-manager.sharedModules = [
            {
              options.sway.enable = lib.mkEnableOption "Enable Sway into Home-Manager";
            }
          ];
        }
        (
          mkIf config.sway.enable {
            environment.sessionVariables.NIXOS_OZONE_WL = "1";
            services.dbus.enable = true;
            xdg.portal = {
              enable = true;
              wlr.enable = true;
              extraPortals = [pkgs.xdg-desktop-portal-gtk];
            };
            programs = {
              sway = {enable = true;};
              light.enable = true;
            };

            services = {
              displayManager = {
                defaultSession = "sway";
                autoLogin = {
                  user = "odric";
                  enable = true;
                };
              };
              xserver = {
                enable = true;
                displayManager = {
                  session = [
                    {
                      manage = "destkop";
                      name = "sway";
                      start = "${launchSway}/bin/launch_sway.sh";
                    }
                  ];

                  gdm = {
                    enable = true;
                    wayland = true;
                  };
                };
              };
            };

            security.polkit.enable = true;

            home-manager.sharedModules = let
              swayEnable = config.sway.enable;
            in [
              {sway.enable = swayEnable;}
            ];
          }
        )
      ];

  imports = [./config.nix ./packages ./programs ./services ./dark-theme.nix];
}
