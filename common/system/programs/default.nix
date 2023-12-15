{...}: {
  programs = {
    fuse.userAllowOther = true;
    adb.enable = false;
    bcc.enable = false;
    gnupg.dirmngr.enable = true;
    steam.enable = false;
    zsh.enable = true;
  };
}
