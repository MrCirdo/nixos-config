{pkgs, ...}: {
  gnome.enable = true;
  sway.enable = false;
  hyprland.enable = false;

  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };

  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
  };

  imports = [./system];
}
