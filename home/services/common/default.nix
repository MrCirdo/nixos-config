{...}: {
  services = {
    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableSshSupport = true;
      pinentryFlavor = "qt";
      extraConfig = "auto-expand-secmem 0x3000000\n";
    };
  };
}
