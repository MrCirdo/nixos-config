{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    kde = {
      enable = lib.mkEnableOption "Enable KDE";
    };
  };

  config = with lib;
    mkMerge [
      {
        home-manager.sharedModules = [
          {
            options.kde.enable = lib.mkEnableOption "Enable KDE";
          }
        ];
      }
      (mkIf config.kde.enable {
        services = {
          # Currently on unstable channel.
          # desktopManager.plasma6.enable = true;
          xserver = {
            enable = true;
            desktopManager.plasma5 = {
              enable = true;
              useQtScaling = true;
            };
            displayManager = {
              sddm.enable = true;
              autoLogin = {
                user = "odric";
                enable = false;
              };
            };
          };
        };
        home-manager.sharedModules = let
          kdeEnable = config.kde.enable;
        in [{kde.enable = kdeEnable;}];
      })
    ];
}
