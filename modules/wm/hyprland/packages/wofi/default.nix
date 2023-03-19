{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.sharedModules = [
    ({config, ...}: let
      theme = config.theme;
    in
      lib.mkIf config.hyprland.enable {
        xdg.configFile."wofi/style.css".text = import ./style.nix {inherit theme;};
        xdg.configFile."wofi/config".source = ./config;
        home.packages = with pkgs; [wofi];
      })
  ];
}
