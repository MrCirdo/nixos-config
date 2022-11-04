{
  config,
  pkgs,
  home-manager,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.default = {
      home = {
        stateVersion = "22.11";
        homeDirectory = "/home/odric";
      };
    };
  };

  fonts.fonts = with pkgs; [
    nerdfonts
    ubuntu_font_family
    source-code-pro
    font-awesome
    (nerdfonts.override {fonts = ["FiraCode"];})
  ];

  imports = [./packages ./programs ./services ./wayland];
}
