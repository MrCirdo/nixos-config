{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    march-native.kernel.zen = {
      enable = lib.mkEnableOption "Add `march=native` flag to zen kernel";
    };
  };

  config = lib.mkIf config.march-native.kernel.zen.enable {
    nixpkgs.overlays = [
      (self: super: {
        linuxPackages_zen = pkgs.linuxPackagesFor (super.linuxPackages_zen.kernel.override {
          extraMakeFlags = ["KCFLAGS=-march=native" "KCPPFLAGS=-march=native"];
          ignoreConfigErrors = true;
        });
      })
    ];
  };
}
