{pkgs, ...}: {
  home-manager.sharedModules = [
    ({config, ...}: {
      xdg.configFile."swaylock-effects/config".text = import ./config.nix {theme = config.theme;};
      home.packages = with pkgs; [swaylock-effects];
    })
  ];
}
