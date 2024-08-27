{...}: {
  programs = {
    fuse.userAllowOther = true;
    adb.enable = true;
    bcc.enable = true;
    gnupg.dirmngr.enable = true;
    steam.enable = true;
    zsh.enable = true;
    system-config-printer.enable = true;
  };
}
