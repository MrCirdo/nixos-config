{
  lib,
  pkgs,
  config,
  ...
}: let
  pythonPackages = (pkgs.python310.withPackages (ps:
    with ps; [
      angr
      docker
      jinja2
      matplotlib
      numpy
      pwntools
      pytest
      python-lsp-server
      yapf
      z3
    ]))
  .override (args: {ignoreCollisions = true;});

  devPackages = with pkgs; [
    # C/C++
    autoconf
    autogen
    automake
    bear
    ccls
    clang-tools
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

    # Rust
    cargo
    clippy
    rust-analyzer
    rustc
    rustfmt

    # Nix
    nil
    rnix-lsp
  ];

  shellPackages = with pkgs; [tree zip unzip btop tmux openssl neofetch zsh-powerlevel10k];

  socialPackages = with pkgs; [
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
    du-dust
    duf
    fd
    firefox
    freetube
    gitlab-runner
    gnupg
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
    thunderbird
    v4l-utils
    virt-manager
    wget
    wl-clipboard
  ];

  gnomePackages = with pkgs.gnome; [gnome-tweaks dconf-editor gnome-themes-extra];
  gnomeShellPackages = with pkgs.gnomeExtensions; [blur-my-shell openweather vitals aylurs-widgets just-perfection dash-to-dock gsconnect hibernate-status-button];

  yubikey = with pkgs; [
    yubikey-manager
    yubikey-manager-qt
    yubikey-personalization
    yubikey-personalization-gui
    yubico-piv-tool
    yubioath-desktop
  ];
in {
  home-manager.sharedModules = [
    {
      home.packages =
        devPackages
        ++ shellPackages
        ++ socialPackages
        ++ reverseEngineeringPackages
        ++ gnomePackages
        ++ gnomeShellPackages
        ++ yubikey
        ++ otherPackages
        ++ [pythonPackages];
    }
  ];
}
