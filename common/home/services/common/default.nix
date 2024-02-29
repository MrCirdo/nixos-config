{config, ...}: {
  services = {
    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableSshSupport = true;
      pinentryFlavor = "gnome3";
    };
    playerctld.enable = true;
  };
}
