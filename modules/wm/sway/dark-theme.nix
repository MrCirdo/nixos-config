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
      home.pointerCursor = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        gtk = {
          enable = true;
        };
        x11 = {
          enable = true;
          defaultCursor = "Adwaita";
        };
        sway.enable = true;
      };

      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };

      gtk = {
        enable = true;
        cursorTheme = {
          size = 25;
          name = "Adwaita";
        };
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
