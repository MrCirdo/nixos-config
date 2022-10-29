{ pkgs, lib, ... }: {
  wayland.windowManager.sway = import programs/sway.nix { inherit pkgs lib; };

  home = {
    username = "odric";
    homeDirectory = "/home/odric";
    stateVersion = "22.05";
    packages = let
      discord-wrapped = pkgs.discord.overrideAttrs (oldAttrs: {
        buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ pkgs.makeWrapper ];
        postFixup = oldAttrs.postFixup or "" + ''
          wrapProgram $out/bin/discord --add-flags "\
          --ignore-gpu-blocklist \
          --disable-features=UseOzonePlatform \
          --enable-features=VaapiVideoDecoder \
          --use-gl=desktop \
          --enable-gpu-rasterization \
          --enable-zero-copy"
        '';
      });
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
      jellyfin-media-player
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
      discord-wrapped
      rustc
      cargo
      rust-analyzer
      rustfmt
      grim
      slurp
      wl-clipboard
      rnix-lsp
    ];
  };

  programs = import ./programs { inherit lib pkgs; };
  services = import ./services { inherit pkgs; };
}
