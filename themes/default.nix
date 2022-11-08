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

    backgroundColor = mkOption {
      example = "#00000";
      type = types.str;
      description = lib.mdDoc "CSS Value of background color.";
    };

    focusColor = mkOption {
      example = "blue";
      type = types.str;
      description = lib.mdDoc "CSS Value of background color.";
    };
  };
}
