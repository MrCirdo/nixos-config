{ lib, pkgs, ... }:

{
  home-manager.enable = true;

  alacritty = import ./alacritty.nix { };
  git = import ./git.nix { };
  zsh = import ./zsh.nix { };
  rofi = import ./rofi.nix { };
  vscode = import ./vscode.nix { inherit pkgs; };
  emacs = import ./doom-emacs { };
  # emacs = import ./emacs.nix { };
  neovim = import ./nvim.nix { inherit pkgs; };
  ssh = import ./ssh.nix { };
  waybar = import ./waybar { inherit lib pkgs; };
  swaylock = import ./swaylock.nix { };
  gpg = import ./gpg.nix { };

}
