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
      pinentry.package = pkgs.pinentry-qt;
    };
    playerctld.enable = true;
    flameshot.enable = true;
  };
}
