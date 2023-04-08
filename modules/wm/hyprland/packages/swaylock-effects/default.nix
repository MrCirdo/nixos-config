{
  config,
  lib,
  ...
}: {
  security.pam.services = lib.mkIf config.hyprland.enable {
    swaylock = {};
    swaylock-effects = {};
  };
  home-manager.sharedModules = [
    ({
      config,
      lib,
      pkgs,
      ...
    }:
      lib.mkIf config.hyprland.enable {
        xdg.configFile."swaylock-effects/config".text = import ./config.nix {theme = config.theme;};
      })
  ];
}
