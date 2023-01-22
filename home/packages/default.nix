{
  lib,
  pkgs,
  config,
  ...
}: let
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
    ]))
  .override (args: {ignoreCollisions = true;});

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
    rr
    gcc
    gnumake
    man-pages
    man-pages-posix
    vagrant
    valgrind

    # Rust
    rustc
    cargo
    rust-analyzer
    rustfmt
    clippy

    # Nix
    rnix-lsp
    nil
  ];

  shellPackages = with pkgs; [tree zip unzip btop tmux openssl neofetch zsh-powerlevel10k];

  socialPackages = with pkgs; [
    signal-desktop
    whatsapp-for-linux
    discord
  ];

  reverseEngineeringPackages = with pkgs; [ghidra];

  otherPackages = with pkgs; [
    bitwarden
    spotify
    playerctl
    grim
    slurp
    wl-clipboard
    jellyfin-media-player
    pavucontrol
    pulseaudio
    firefox
    thunderbird
    pmutils
    rclone
    pandoc
    texlive.combined.scheme-full
    pinentry-curses
    gnupg
    duf
    lazygit
    fd
    ripgrep
    du-dust
    tealdeer
    htop
    bat
    libseccomp
    v4l-utils
    freetube
    wget
    bcc
    spotify-tui
    qemu_kvm
    virt-manager
    gtk-engine-murrine
    chromium
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

  # I need to configure wofi and swaylock effects.
  imports = [./wofi ./swaylock-effects];
}
