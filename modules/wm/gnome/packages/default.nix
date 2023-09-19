{config, lib, ...}: {
  home-manager.sharedModules = lib.mkIf config.gnome.enable [
    ({pkgs, ...}: {
      home.packages = let
        gnomePackages = with pkgs.gnome; [gnome-tweaks dconf-editor gnome-themes-extra];
        gnomeShellPackages = with pkgs.gnomeExtensions; [blur-my-shell openweather vitals aylurs-widgets just-perfection dash-to-dock gsconnect hibernate-status-button];
      in
        gnomeShellPackages
        ++ gnomePackages;
    })
  ];
}
