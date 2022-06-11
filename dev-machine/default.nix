{ pkgs, ... }:

{
  home-manager.users.odric = {
    programs = {
      alacritty = {
        enable = true;
        background_opacity = 0.3;
      };
    };
  };
}
