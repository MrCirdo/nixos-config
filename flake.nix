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
          imports = [ ./common ];

          users.users.odric = {
            isNormalUser = true;
            description = "Odric";
            extraGroups = [ "networkmanager" "wheel" ];
          };

          system.stateVersion = "22.05"; # Did you read the comment?

        })
      ];
    };
  };
}
