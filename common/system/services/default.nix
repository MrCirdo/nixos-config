{pkgs, ...}: {
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    udev.packages = [pkgs.yubikey-personalization];
    pcscd.enable = true;
    gitlab-runner.enable = true;
  };
}
