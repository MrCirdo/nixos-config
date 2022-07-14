{ pkgs, lib, ... }:

{
  system.nixos.label = "Laptop";
  system.nixos.tags = [ "school" "gnome" ];
  services.xserver = {
    enable = true;
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

  services.xserver.desktopManager.gnome.enable = true;
}
