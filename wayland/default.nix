{ ... }:

{
  programs = {
    sway = { enable = true; };

    light.enable = true;
  };

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  security.polkit.enable = true;
}
