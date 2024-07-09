{pkgs, ...}: {
  networking.firewall.checkReversePath = "loose";
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      extraConfig.pipewire-pulse."50-network-party" = {
        context.modules = [
          {
            name = "module-native-protocol-tcp";
            args = {};
          }
          {
            name = "module-zeroconf-discover";
            args = {};
          }
          {
            name = "module-zeroconf-publish";
            args = {};
          }
        ];
      };
      alsa.enable = true;
    };
    tailscale.enable = true;
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
