{pkgs, ...}: {
  home-manager.sharedModules = [
    {
      xdg.configFile."swaylock-effects/config".source = ./config;
      home.packages = with pkgs; [swaylock-effects];
    }
  ];
}
