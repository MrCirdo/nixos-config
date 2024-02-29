{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.sharedModules = [
    ({
      config,
      theme,
      ...
    }:
      lib.mkIf config.sway.enable {
        xdg.configFile."wofi/style.css".text = import ./style.nix {inherit theme;};
        xdg.configFile."wofi/config".source = ./config;
        home.packages = with pkgs; [wofi];
      })
  ];
}
