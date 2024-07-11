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
          desktopManager = {
            plasma6.enable = true;
          };
          displayManager = {
            sddm.enable = true;
            defaultSession = "plasma";
            autoLogin = {
              user = "odric";
              enable = false;
            };
          };
          xserver = {
            enable = true;
            displayManager = {
            };
          };
        };
        home-manager.sharedModules = let
          kdeEnable = config.kde.enable;
        in [{kde.enable = kdeEnable;}];
      })
    ];
}
