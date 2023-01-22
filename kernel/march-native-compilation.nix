{pkgs, ...}:
{
  #extraMakeFlags =  [ "KCFLAGS=-march=native" "KCPPFLAGS=-march=native"];
  #ignoreConfigErrors = true;
  nixpkgs.overlay = [(self: super: {
      linuxPackages_zen.kernel = super.linuxPackages_zen.kernel.ovverideAttrs(oldAttrs: {
      });
  })];  
}
