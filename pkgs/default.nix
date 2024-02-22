{pkgs, ...}: {
  kboot = pkgs.callPackage ./kboot.nix {};
}
