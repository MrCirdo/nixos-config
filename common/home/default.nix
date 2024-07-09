{pkgs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.default = {
      home = {
        stateVersion = "22.11";
      };
    };
    sharedModules = [
      ./packages
      ./programs
      ./services
    ];
  };

  imports = [./services/common/spotifyd.nix];

  fonts.packages = with pkgs; [
    nerdfonts
    ubuntu_font_family
    source-code-pro
    font-awesome
    fira-code
    fira-code-symbols
    borg-sans-mono
  ];
}
