{
  pkgs,
  config,
  ...
}: {
  networking.hostName = "Wookiee";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernel.sysctl = {
    "kernel.perf_event_paranoid" = 1;
  };

  i18n.defaultLocale = "en_US.utf8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.utf8";
    LC_IDENTIFICATION = "fr_FR.utf8";
    LC_MEASUREMENT = "fr_FR.utf8";
    LC_MONETARY = "fr_FR.utf8";
    LC_NAME = "fr_FR.utf8";
    LC_NUMERIC = "fr_FR.utf8";
    LC_PAPER = "fr_FR.utf8";
    LC_TELEPHONE = "fr_FR.utf8";
    LC_TIME = "fr_FR.utf8";
  };

  sops.age.keyFile = "${config.users.users.default.home}/.config/sops/age/keys.txt";
  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  users.mutableUsers = true;
  users.users.default = {
    name = "odric";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "docker" "video" "fuse" "adbusers" "kvm" "libvirt"];
    initialPassword = "root";
  };

  virtualisation = {
    docker.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment = {
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    extra-substituters = ["https://helix.cachix.org" "https://nixpkgs-wayland.cachix.org"];
    extra-trusted-public-keys = ["helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs=" "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11"; # Did you read the comment?
  networking.nameservers = ["1.1.1.1" "1.0.0.1"];

  hardware.opengl.enable = true;

  powerManagement = {
    enable = false;
    powerDownCommands = "${pkgs.swaylock-effects}/bin/swaylock -C $HOME/.config/swaylock-effects/config";
  };

  imports = [./macbookpro ./services ./programs];

  gnome.enable = true;
}
