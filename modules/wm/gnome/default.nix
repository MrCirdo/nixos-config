{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    gnome = {
      enable = lib.mkEnableOption "Enable Gnome";
    };
  };

  config = with lib;
    mkMerge [
      {
        home-manager.sharedModules = [
          {
            options.gnome.enable = lib.mkEnableOption "Enable gnome into Home-Manager";
          }
        ];
      }
      (mkIf config.gnome.enable {
        services.xserver = {
          enable = true;
          displayManager.gdm = {
            enable = true;
            wayland = true;
          };

          desktopManager.gnome.enable = true;
        };

        home-manager.sharedModules = let
          gnomeEnable = config.gnome.enable;
        in [{gnome.enable = gnomeEnable;}];
      })
    ];

  imports = [./config.nix ./packages];
}
