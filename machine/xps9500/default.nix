{pkgs, ...}: {
  gnome.enable = true;
  sway.enable = false;
  hyprland.enable = false;
  imports = [./system];
}
