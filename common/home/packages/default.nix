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
    cmake
    ctags
    gcc
    gdb
    gnumake
    man-pages
    man-pages-posix

    # Rust
    cargo
    clippy
    rust-analyzer
    rustc
    rustfmt

    # Nix
    nil

    #python
    python3
  ];

  shellPackages = with pkgs; [tree zip unzip btop openssl zsh-powerlevel10k];

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
    fastfetch
    fd
    firefox
    gnupg
    htop
    jellyfin-media-player
    lazygit
    lf
    openconnect
    pmutils
    rclone
    ripgrep
    slurp
    spotify
    thunderbird
    virt-manager
    wdisplays
    wget
    wl-clipboard
  ];

  unstablePackage = with pkgs-unstable; [
    clang-tools_18
    heroic
    protonmail-desktop
    rr
    vesktop
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
