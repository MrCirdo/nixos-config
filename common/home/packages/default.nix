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
    ccls
    clang-tools_15
    cmake
    ctags
    gcc
    gdb
    gnumake
    man-pages
    man-pages-posix
    rr
    vagrant
    valgrind
    jetbrains.clion

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
    discord
    signal-desktop
    whatsapp-for-linux
  ];

  reverseEngineeringPackages = with pkgs; [ghidra];

  otherPackages = with pkgs; [
    bat
    bcc
    bitwarden
    chromium
    direnv
    du-dust
    duf
    fd
    firefox
    freetube
    gitlab-runner
    gnupg
    go
    grim
    gtk-engine-murrine
    htop
    jellyfin-media-player
    lazygit
    libseccomp
    nodejs-16_x
    pandoc
    pavucontrol
    pinentry-curses
    playerctl
    pmutils
    pre-commit
    pulseaudio
    qemu_kvm
    rclone
    ripgrep
    slurp
    spotify
    spotify-tui
    tealdeer
    texlive.combined.scheme-full
    v4l-utils
    virt-manager
    wget
    wl-clipboard
  ];

  unstablePackage = with pkgs-unstable; [
    vscode
    thunderbird
  ];


  yubikey = with pkgs; [
    yubikey-manager
    yubikey-manager-qt
    yubikey-personalization
    yubikey-personalization-gui
    yubico-piv-tool
    yubioath-flutter
  ];
in {
  home-manager.sharedModules = [
    {
      home.packages =
        devPackages
        ++ shellPackages
        ++ socialPackages
        ++ reverseEngineeringPackages
        ++ yubikey
        ++ otherPackages
        ++ unstablePackage
    }
  ];
}
