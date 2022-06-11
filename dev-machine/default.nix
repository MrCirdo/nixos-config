{ config, pkgs, lib, ... }:

{ home-manager.users.odric = {
    home = {
      username = "Odric";
      homeDirectory = "/home/odric";
    };

    programs = {
      alacritty = {
        enable = true;
        background_opacity = 0.3;
      };
    };
  };
}
