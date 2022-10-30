{ pkgs, ... }:

{
  home-manager.sharedModules = [{
    xdg.configFile."wofi/style.css".source = ./style.css;
    xdg.configFile."wofi/config".source = ./config;
    home.packages = with pkgs; [ wofi ];
  }];
}
