{
  lib,
  config,
  ...
}: {
  home-manager.sharedModules = lib.mkIf config.sway.enable [
    ({
      pkgs,
      lib,
      config,
      ...
    }: {
      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };

      gtk = {
        enable = true;
        theme = {
          name = "Adwaita-dark";
          package = pkgs.gnome-themes-extra;
        };
      };

      # Wayland, X, etc. support for session vars

      qt = {
        enable = true;
        platformTheme.name = "adwaita";
        style = {
          name = "adwaita-dark";
        };
      };
    })
  ];
}
