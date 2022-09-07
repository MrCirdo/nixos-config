{ pkgs, lib, ... }:

{
  wayland.windowManager.sway = import programs/sway.nix { inherit pkgs lib; };

  home = {
    username = "odric";
    homeDirectory = "/home/odric";
    packages =
      let
        python-packages = (pkgs.python310.withPackages (ps: with ps; [ pwntools z3 angr numpy matplotlib six])).override (args: { ignoreCollisions = true; });
      in
      with pkgs;
      [
        vlc
        discord
        feh
        tree
        gdb
        gcc_multi
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
        virtualbox
        ccls
        clang-tools
        lldb
        cider
        ghidra
        man-pages
        man-pages-posix
        tmux
        vagrant
        nixpkgs-fmt
        wayland
        python-packages
        chromium
        android-tools
        openssl
      ];


    file.".doom.d" = {
      # Get Doom Emacs
      source =
        ./programs/doom-emacs/doom.d; # Sets up symlink name ".doom.d" for file "doom.d"
      recursive = true; # Allow symlinking a directory
      onChange = builtins.readFile
        ./programs/doom-emacs/doom.sh; # If an edit is detected, it will run this script
    };
  };

  programs = import ./programs { inherit lib pkgs; };
  services = import ./services { inherit pkgs; };
}
