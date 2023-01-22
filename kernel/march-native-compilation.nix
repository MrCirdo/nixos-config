{pkgs, ...}: {
  nixpkgs.overlays = [
    (self: super: {
      linuxPackages_zen = pkgs.linuxPackagesFor (super.linuxPackages_zen.kernel.override {
        extraMakeFlags = ["KCFLAGS=-march=native" "KCPPFLAGS=-march=native"];
        ignoreConfigErrors = true;
      });
    })
  ];
}
