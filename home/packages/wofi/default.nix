{
  pkgs,
  config,
  ...
}: {
  home-manager.sharedModules = [
    ({config, ...}: let
      theme = config.theme;
    in {
      xdg.configFile."wofi/style.css".text = import ./style.nix {inherit theme;};
      xdg.configFile."wofi/config".source = ./config;
      home.packages = with pkgs; [wofi];
    })
  ];
}
