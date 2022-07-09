{ pkgs, lib, ... }:

{
  services.xserver = {
    enable = false;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkbOptions = "caps:escape";
    libinput.enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 50;

    displayManager = {
      #lightdm.enable = true;
      sessionCommands = ''
        ${pkgs.xorg.xset}/bin/xset r rate 200 150
      '';
    };
  };
}
