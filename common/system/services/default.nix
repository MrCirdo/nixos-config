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
    tailscale.enable = true;
    openssh = {
      enable = true;
      settings.X11Forwarding = true;
    };

    fwupd.enable = true;
    pcscd.enable = true;
    tlp.enable = true;
    udev.packages = [pkgs.yubikey-personalization pkgs.logitech-udev-rules];

    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };
  };
}
