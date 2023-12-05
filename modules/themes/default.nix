{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.theme;
in {
  options.theme = {
    tailwindcss = mkOption {
      type = types.attrs;
      default = import ./tailwindcss.nix;
      description = lib.mdDoc ''
        Set tailwindcss color

        Example :
        tailwindcss.gray."50" = "blue";
      '';
    };

    wallpaper = mkOption {
      type = types.path;
      description = lib.mdDoc "The path of background image.";
    };

    backgroundColor = mkOption {
      example = "#00000";
      type = types.str;
      description = lib.mdDoc "CSS Value of background color.";
    };

    backgroundColor2 = mkOption {
      example = "#00000";
      type = types.str;
      description = lib.mdDoc "CSS value of second background color.";
    };

    backgroundColor3 = mkOption {
      example = "#00000";
      type = types.str;
      description = lib.mdDoc "CSS value of third background color.";
    };

    textColor = mkOption {
      example = "#00000";
      type = types.str;
      description = lib.mdDoc "CSS value of text color.";
    };

    textColor2 = mkOption {
      example = "#00000";
      type = types.str;
      description = lib.mdDoc "CSS value of second text color.";
    };

    textColor3 = mkOption {
      example = "#00000";
      type = types.str;
      description = lib.mdDoc "CSS value of third text color.";
    };

    focusColor = mkOption {
      example = "blue";
      type = types.str;
      description = lib.mdDoc "CSS Value of focus color.";
    };

    focusColor2 = mkOption {
      example = "blue";
      type = types.str;
      description = lib.mdDoc "CSS Value of second background color.";
    };

    focusColor3 = mkOption {
      example = "blue";
      type = types.str;
      description = lib.mdDoc "CSS Value of third background color.";
    };

    alertColor = mkOption {
      example = "blue";
      type = types.str;
      description = lib.mdDoc "CSS Value of alert color.";
    };
  };

  config = with lib;
    mkMerge [
      {
        home-manager.sharedModules = [
          {
            options.theme = {
              tailwindcss = mkOption {
                type = types.attrs;
                default = import ./tailwindcss.nix;
                description = lib.mdDoc ''
                  Set tailwindcss color

                  Example :
                  tailwindcss.gray."50" = "blue";
                '';
              };

              wallpaper = mkOption {
                type = types.path;
                description = lib.mdDoc "The path of background image.";
              };

              backgroundColor = mkOption {
                example = "#00000";
                type = types.str;
                description = lib.mdDoc "CSS Value of background color.";
              };

              backgroundColor2 = mkOption {
                example = "#00000";
                type = types.str;
                description = lib.mdDoc "CSS value of second background color.";
              };

              backgroundColor3 = mkOption {
                example = "#00000";
                type = types.str;
                description = lib.mdDoc "CSS value of third background color.";
              };

              textColor = mkOption {
                example = "#00000";
                type = types.str;
                description = lib.mdDoc "CSS value of text color.";
              };

              textColor2 = mkOption {
                example = "#00000";
                type = types.str;
                description = lib.mdDoc "CSS value of second text color.";
              };

              textColor3 = mkOption {
                example = "#00000";
                type = types.str;
                description = lib.mdDoc "CSS value of third text color.";
              };

              focusColor = mkOption {
                example = "blue";
                type = types.str;
                description = lib.mdDoc "CSS Value of focus color.";
              };

              focusColor2 = mkOption {
                example = "blue";
                type = types.str;
                description = lib.mdDoc "CSS Value of second background color.";
              };

              focusColor3 = mkOption {
                example = "blue";
                type = types.str;
                description = lib.mdDoc "CSS Value of third background color.";
              };

              alertColor = mkOption {
                example = "blue";
                type = types.str;
                description = lib.mdDoc "CSS Value of alert color.";
              };
            };
          }
        ];
      }
      {
        home-manager.sharedModules = let
          wallpaper = config.theme.wallpaper;
          backgroundColor = config.theme.backgroundColor;
          backgroundColor2 = config.theme.backgroundColor2;
          backgroundColor3 = config.theme.backgroundColor3;
          textColor = config.theme.textColor;
          textColor2 = config.theme.textColor2;
          textColor3 = config.theme.textColor3;
          focusColor = config.theme.focusColor;
          focusColor2 = config.theme.focusColor2;
          focusColor3 = config.theme.focusColor3;
          alertColor = config.theme.alertColor;
        in [
          {
            theme = {
              inherit
                wallpaper
                backgroundColor
                backgroundColor2
                backgroundColor3
                textColor
                textColor2
                textColor3
                focusColor
                focusColor2
                focusColor3
                alertColor
                ;
            };
          }
        ];
      }
    ];
}
