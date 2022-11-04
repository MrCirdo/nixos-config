{ lib, pkgs, config, ... }:
let
  pythonPackages = (pkgs.python310.withPackages (ps:
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
      pytest
    ])).override (args: { ignoreCollisions = true; });

  devPackages = with pkgs; [
    # C/C++
    automake
    autogen
    autoconf
    bear
    ccls
    cmake
    ctags
    clang-tools
    gdb
    gcc
    gnumake
    man-pages
    man-pages-posix
    vagrant

    # Rust
    rustc
    cargo
    rust-analyzer

    # Nix
    rnix-lsp
  ];

  shellPackages = with pkgs; [ tree zip unzip htop tmux openssl ];

  socialPackages = with pkgs; [
    signal-desktop
    whatsapp-for-linux
    discord-canary
    discord
  ];

  reverseEngineeringPackages = with pkgs; [ ghidra ];

  otherPackages = with pkgs; [
    bitwarden
    spotify
    playerctl
    grim
    slurp
    wl-clipboard
    jellyfin-media-player
    networkmanager_dmenu
    pavucontrol
    pulseaudio
    firefox
    thunderbird
  ];
in {
  home-manager.sharedModules = [{
    home.packages = devPackages ++ shellPackages ++ socialPackages
      ++ reverseEngineeringPackages ++ otherPackages ++ [ pythonPackages ];
  }];

  # I need to configure wofi and swaylock effects.
  imports = [ ./wofi ./swaylock-effects ];
}

