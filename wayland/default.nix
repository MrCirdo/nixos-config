{ pkgs, ... }:

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

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.sway}/bin/sway";
        user = "odric";
      };
      default_session = initial_session;
    };
  };
}
