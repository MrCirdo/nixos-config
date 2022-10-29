{ ... }:

{
  services = {
    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      pinentryFlavor = "curses";
    };
  };
}
