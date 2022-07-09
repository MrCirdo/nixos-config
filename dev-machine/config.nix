{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    dejavu_fonts
    nerdfonts
    roboto
    roboto-mono
    victor-mono
    ubuntu_font_family
    carlito
    vegur
    source-code-pro
    jetbrains-mono
    font-awesome
    corefonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  services.xserver = {
    enable = false;
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
