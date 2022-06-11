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

    nixosConfigurations = let
      system = "x86_64-linux";
      modules = [
        ({ pkgs, ... }: {
          imports = [ ./common ];

          system.stateVersion = "22.05"; # Did you read the comment?
          users.users.odric = {
            isNormalUser = true;
            description = "Odric";
            shell = pkgs.zsh;
            extraGroups = [ "networkmanager" "wheel" ];
          };

          nixosModules.home.home-manager = {
            home-manager.verbose = true;
            home-manager.useUserPackages = true;
            home-manager.users.odric = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          };

        })
      ];
    in {
      dev-machine = nixpkgs.lib.nixosSystem {
        inherit system modules;
        #modules = modules
        #  ++ [ ({ pkgs, ... }: { imports = [ ./dev-machine ]; }) ];
      };
    };
  };
}
