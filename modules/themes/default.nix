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
      description = mdDoc ''
        Set tailwindcss color

        Example :
        tailwindcss.gray."50" = "blue";
      '';
    };

    backgroundColor = mkOption {
      example = "#00000";
      type = types.str;
      description = mdDoc "CSS Value of background color.";
    };

    backgroundColor2 = mkOption {
      example = "#00000";
      type = types.str;
      description = mdDoc "CSS value of second background color.";
    };

    backgroundColor3 = mkOption {
      example = "#00000";
      type = types.str;
      description = mdDoc "CSS value of third background color.";
    };

    textColor = mkOption {
      example = "#00000";
      type = types.str;
      description = mdDoc "CSS value of text color.";
    };

    textColor2 = mkOption {
      example = "#00000";
      type = types.str;
      description = mdDoc "CSS value of second text color.";
    };

    textColor3 = mkOption {
      example = "#00000";
      type = types.str;
      description = mdDoc "CSS value of third text color.";
    };

    focusColor = mkOption {
      example = "blue";
      type = types.str;
      description = mdDoc "CSS Value of focus color.";
    };

    focusColor2 = mkOption {
      example = "blue";
      type = types.str;
      description = mdDoc "CSS Value of second background color.";
    };

    focusColor3 = mkOption {
      example = "blue";
      type = types.str;
      description = mdDoc "CSS Value of third background color.";
    };

    alertColor = mkOption {
      example = "blue";
      type = types.str;
      description = mdDoc "CSS Value of alert color.";
    };
  };
}
