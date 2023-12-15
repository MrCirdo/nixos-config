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
    openssh.enable = true;

    tailscale.enable = true;

    udev.packages = [pkgs.yubikey-personalization pkgs.logitech-udev-rules];
    pcscd.enable = true;
    gitlab-runner.enable = false;

    fwupd.enable = true;
  };
}
