{pkgs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.default = {
      home = {
        stateVersion = "22.11";
      };
    };
  };

  fonts.fonts = with pkgs; [
    ubuntu_font_family
    source-code-pro
    font-awesome
    fira-code
    fira-code-symbols
    nerdfonts
  ];

  imports = [./packages ./programs ./services];
}
