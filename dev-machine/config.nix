{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    carlito
    vegur
    source-code-pro
    jetbrains-mono
    font-awesome
    corefonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  services.xserver = {
    enable = true;
    xkbOptions = "caps:escape";
    libinput.enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 50;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };

    displayManager = {
      lightdm.enable = true;
      sessionCommands = ''
        ${pkgs.xorg.xset}/bin/xset r rate 200 50
      '';
    };
  };
}
