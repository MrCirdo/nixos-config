{pkgs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.default = {
      home = {
        stateVersion = "24.11";
      };
    };
    sharedModules = [
      ./packages
      ./programs
      ./services
    ];
  };

  imports = [./services/common/spotifyd.nix];

  fonts.packages = with pkgs;
    [
      ubuntu_font_family
      source-code-pro
      font-awesome
      fira-code
      fira-code-symbols
      borg-sans-mono
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
