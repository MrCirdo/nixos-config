{
  pkgs,
  pkgs-unstable,
  ...
}: let
  libunwindDebug = pkgs-unstable.libunwind.overrideAttrs (old: {
    configureFlags = old.configureFlags ++ ["--enable-debug"];
  });
in
  with pkgs;
    mkShell {
      inputsFrom = [
        htop
      ];
      buildInputs = [
        astyle
        autoconf
        libiberty
        libunwindDebug
        ncurses
        valgrind
        asciinema_3
      ];
    }
