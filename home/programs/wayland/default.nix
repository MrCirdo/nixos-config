{config, ...}: {
  programs = {
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
