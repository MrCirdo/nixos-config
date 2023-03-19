{...}: {
  home-manager.sharedModules = [
    (
      {
        lib,
        config,
        ...
      }: {
        services = lib.mkIf config.hyprland.enable {
          gammastep = {
            enable = true;
            dawnTime = "8:00";
            duskTime = "21:00";
            temperature.night = 2500;
          };
          mako = {
            enable = true;
            backgroundColor = config.theme.focusColor;
            borderColor = config.theme.focusColor2;
            defaultTimeout = 10000;
            borderRadius = 8;
          };
        };
      }
    )
  ];
}
