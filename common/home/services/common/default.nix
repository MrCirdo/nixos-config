{config, ...}: {
  services = {
    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableSshSupport = true;
      pinentryFlavor = "qt";
    };
    playerctld.enable = true;
  };
}
