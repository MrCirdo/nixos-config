{ pkgs, lib, ... }:

{
  system.nixos.label = "Desktop";
  services.xserver.displayManager.gdm.wayland = true;

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [ swaylock swayidle ];
  };

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr ];
  };

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
