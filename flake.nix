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

	outputs = {self, nixpkgs, home-manager, flake-utils, ...} @inputs: {
		nixosConfigurations.odric = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ ({ pkgs, ... }: {
					imports =
					[ # Include the results of the hardware scan.
					./hardware-configuration.nix
					];

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
# If you want to use JACK applications, uncomment this
#jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
					};

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
					users.users.odric = {
						isNormalUser = true;
						description = "Odric";
						extraGroups = [ "networkmanager" "wheel" ];
					};

# Allow unfree packages
					nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
					environment.systemPackages = with pkgs; [
						vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
							wget
							firefox
					];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
					system.stateVersion = "22.05"; # Did you read the comment?

						nix = {
							package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
								extraOptions = ''
								experimental-features = nix-command flakes
								'';
						};

			})];
		};
	};
}
