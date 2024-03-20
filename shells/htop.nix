{pkgs, ...}: let
  libunwindDebug = pkgs.libunwind.overrideAttrs (old: {
    configureFlags = old.configureFlags ++ ["--enable-debug"];
  });
in
  with pkgs;
    mkShell {
      inputsFrom = [
        htop
      ];
      buildInputs = [
        autoconf
        ncurses
        libunwindDebug
        astyle
        libiberty
      ];
    }
