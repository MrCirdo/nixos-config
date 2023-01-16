{
  config,
  lib,
  ...
}: {
  programs = lib.mkIf config.sway.enable {
    mako = {
      enable = true;
      backgroundColor = config.theme.focusColor;
      borderColor = config.theme.focusColor2;
      defaultTimeout = 10000;
      borderRadius = 8;
    };
  };

  imports = [./waybar];
}
