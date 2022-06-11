{
  description = "My nixos dot-file";
  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOs";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      ref = "master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
      ref = "master";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }@inputs: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
    nixosConfigurations.dev-machine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ pkgs, ... }: {
          imports = [ ./hardware-configuration.nix ];

          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;
          boot.loader.efi.efiSysMountPoint = "/boot/efi";

          networking.hostName = "nixos"; # Define your hostname.
          # networking.wireless.enable = true;  

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
          services.xserver.enable = true;

          services.xserver.displayManager.gdm.enable = true;
          services.xserver.desktopManager.gnome.enable = true;

          services.xserver = {
            layout = "us";
            xkbVariant = "";
          };

          services.printing.enable = true;

          sound.enable = true;
          hardware.pulseaudio.enable = false;
          security.rtkit.enable = true;
          services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
          };

          users.users.odric = {
            isNormalUser = true;
            description = "Odric";
            extraGroups = [ "networkmanager" "wheel" ];
          };

          nixpkgs.config.allowUnfree = true;

          environment.systemPackages = with pkgs; [
            vim
            wget
            firefox
            discord
            vscode
            git
            gcc
          ];

          system.stateVersion = "22.05"; # Did you read the comment?

          nix = {
            package =
              pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
            extraOptions = ''
              experimental-features = nix-command flakes
            '';
          };
        })
      ];
    };
  };
}
