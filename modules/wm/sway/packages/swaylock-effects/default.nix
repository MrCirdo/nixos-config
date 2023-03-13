{...}: {
  home-manager.sharedModules = [
    ({
      config,
      lib,
      pkgs,
      ...
    }:
      lib.mkIf config.sway.enable {
        xdg.configFile."swaylock-effects/config".text = import ./config.nix {theme = config.theme;};
        home.packages = with pkgs; [swaylock-effects];
      })
  ];
}
