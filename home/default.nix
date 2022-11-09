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
    nerdfonts
    ubuntu_font_family
    source-code-pro
    font-awesome
    fira-code
    fira-code-symbols
    (nerdfonts.override {fonts = ["FiraCode"];})
  ];

  imports = [./theme ./packages ./programs ./services ./wayland];
}
