{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: let
  devPackages = with pkgs; [
    # C/C++
    autoconf
    autogen
    automake
    bear
    clang-tools_17
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

  shellPackages = with pkgs; [tree zip unzip btop openssl neofetch zsh-powerlevel10k];

  socialPackages = with pkgs-unstable; [
    signal-desktop
  ];

  reverseEngineeringPackages = with pkgs; [ghidra];

  otherPackages = with pkgs; [
    bat
    bluetuith
    bluez
    chromium
    du-dust
    duf
    fd
    firefox
    gnupg
    htop
    jellyfin-media-player
    lazygit
    openconnect
    pmutils
    rclone
    ripgrep
    slurp
    spotify
    virt-manager
    wdisplays
    wget
    wl-clipboard
  ];

  unstablePackage = with pkgs-unstable; [
    armcord
    heroic
    vscode
  ];
in {
  home.packages =
    devPackages
    ++ otherPackages
    ++ reverseEngineeringPackages
    ++ shellPackages
    ++ socialPackages
    ++ unstablePackage;
}
