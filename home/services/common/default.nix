{config, ...}: {
  services = {
    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableSshSupport = true;
      pinentryFlavor =
        if config.gnome.enable
        then "gnome3"
        else "qt";
    };
  };
}
