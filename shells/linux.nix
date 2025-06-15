{
  pkgs,
  ...
}:
  with pkgs;
    mkShell {
      inputsFrom = [
        linux
      ];
      buildInputs = [
        ncurses
        pkg-config
      ];
    }
