{ pkgs, lib, ... }:

{
  wayland.windowManager.sway = import programs/sway.nix { inherit pkgs lib; };

  home = {
    username = "odric";
    homeDirectory = "/home/odric";
    stateVersion = "22.05";
    packages = let
      python-packages = (pkgs.python310.withPackages (ps:
        with ps; [
          pwntools
          z3
          angr
          numpy
          matplotlib
          jinja2
          yapf
          docker
          python-lsp-server
        ])).override (args: { ignoreCollisions = true; });
    in with pkgs; [
      feh
      tree
      gdb
      gcc
      glibc
      gnumake
      automake
      autogen
      autoconf
      cmake
      zip
      unzip
      bitwarden
      thunderbird
      mpv
      jellyfin-mpv-shim
      bear
      htop
      ctags
      ccls
      clang-tools
      ghidra-bin
      man-pages
      man-pages-posix
      tmux
      vagrant
      nixpkgs-fmt
      wayland
      python-packages
      chromium
      openssl
      spotify
      signal-desktop
      whatsapp-for-linux
      discord
      rustc
      cargo
      rust-analyzer
    ];
  };

  programs = import ./programs { inherit lib pkgs; };
  services = import ./services { inherit pkgs; };
}
