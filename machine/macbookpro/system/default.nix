{pkgs, ...}: {
  gnome.enable = false;
  sway.enable = true;
  hyprland.enable = false;

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_15;
  powerManagement.powerUpCommands = ''
    ${pkgs.systemd}/bin/systemctl restart wpa_supplicant.service
  '';
  imports = [./hardware-configuration.nix ./boot-configuration.nix];
}
