{pkgs, ...}: {
  networking.hostName = "Wookiee";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

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

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  users.mutableUsers = true;
  users.users.default = {
    name = "odric";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "docker" "video" "fuse" "adbusers"];
    initialPassword = "root";
  };

  virtualisation.docker.enable = true;

  environment = {
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11"; # Did you read the comment?
  networking.nameservers = ["1.1.1.1" "1.0.0.1"];

  imports = [./macbookpro ./services ./programs];
}
