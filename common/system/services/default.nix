{pkgs, ...}: {
  networking.firewall.checkReversePath = "loose";
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
    tailscale.enable = true;
    usbmuxd = {
      enable = true;
      package = pkgs.usbmuxd2;
    };
    openssh = {
      enable = true;
      settings.X11Forwarding = true;
    };

    fwupd.enable = true;
    pcscd.enable = true;
    udev.packages = [pkgs.yubikey-personalization pkgs.logitech-udev-rules];

    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
