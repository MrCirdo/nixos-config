{ pkgs, ... }:

{
  home-manager.enable = true;

  alacritty = import ./alacritty.nix { };
  git = import ./git.nix { };
  zsh = import ./zsh.nix { };
  rofi = import ./rofi.nix { };
  vscode = import ./vscode.nix { };
}
