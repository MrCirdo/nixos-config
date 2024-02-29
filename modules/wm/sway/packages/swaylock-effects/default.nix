{...}: {
  home-manager.sharedModules = [
    ({
      config,
      lib,
      pkgs,
      theme,
      ...
    }:
      lib.mkIf config.sway.enable {
        xdg.configFile."swaylock-effects/config".text = import ./config.nix {inherit theme;};
        home.packages = with pkgs; [swaylock-effects];
      })
  ];
}
