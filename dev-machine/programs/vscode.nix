{ pkgs, ... }:

{
  enable = true;
  userSettings = { "keyboard.dispatch" = "keyCode"; };
  package = pkgs.vscodium;
  extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    github.copilot
    eamodio.gitlens
    ms-python.python
    ms-vscode.cpptools
    jnoortheen.nix-ide
  ];
}
