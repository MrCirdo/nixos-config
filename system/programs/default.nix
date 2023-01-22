{...}: {
  programs = {
    fuse.userAllowOther = true;
    adb.enable = true;
    bcc.enable = true;
    gnupg.dirmngr.enable = true;
  };
}
