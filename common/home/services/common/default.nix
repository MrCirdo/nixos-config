{
  config,
  pkgs,
  ...
}: {
  services = {
    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableSshSupport = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
    playerctld.enable = true;
    flameshot.enable = true;
  };
}
