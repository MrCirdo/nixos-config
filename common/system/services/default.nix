{pkgs, ...}: {
  networking.firewall.checkReversePath = "loose";
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    cpupower-gui.enable = true;
    fwupd.enable = true;
    pcscd.enable = true;
    udev.packages = [pkgs.yubikey-personalization pkgs.logitech-udev-rules];
  };
}
