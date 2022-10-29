{ config, pkgs, home-manager, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.odric = {
      home = {
        stateVersion = "22.11";
        homeDirectory = "/home/odric";
      };
    };
  };

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

  imports = [ ./packages ./programs ./services ./wayland ];
}
