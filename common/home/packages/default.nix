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
    rust-analyzer

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
    heroic
    htop
    jellyfin-media-player
    lazygit
    lf
    nfs-utils
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
    discord
    neovim
    prismlauncher
    protonmail-desktop
    rr
    vscodium
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
