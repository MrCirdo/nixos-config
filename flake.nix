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
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;

    nixosConfigurations = let
      system = "x86_64-linux";
      modules = [ ./common ];
    in {
      dev-machine = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = modules ++ [ ./dev-machine/config.nix ] ++ [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.odric = {
              imports = [ ./dev-machine/home.nix ];
            };
          }
        ];
      };
    };
  };
}
