{
  lib,
  pkgs,
  config,
  pkgs-unstable,
  ...
}: let
  devPackages = with pkgs; [
    # C/C++
    autoconf
    autogen
    automake
    bear
    clang-tools_16
    cmake
    ctags
    gcc
    gdb
    gnumake
    man-pages
    man-pages-posix
    rr

    # Rust
    cargo
    clippy
    rust-analyzer
    rustc
    rustfmt

    # Nix
    nil
    rnix-lsp

    #python
    python3
  ];

  shellPackages = with pkgs; [tree zip unzip zsh-powerlevel10k];

  socialPackages = with pkgs-unstable; [
    discord
    signal-desktop
  ];

  reverseEngineeringPackages = with pkgs; [ghidra];

  otherPackages = with pkgs; [
    bat
    duf
    fd
    firefox
    gnupg
    grim
    gtk-engine-murrine
    htop
    wget
    wl-clipboard
  ];

  unstablePackage = with pkgs-unstable; [
    vscode
    thunderbird
  ];
in {
  home-manager.sharedModules = [
    {
      home.packages =
        otherPackages
        ++ shellPackages
    }
  ];
}
