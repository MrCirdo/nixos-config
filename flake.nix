{
  description = "My personal nixos config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    helix.url = "github:helix-editor/helix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    sops-nix,
    helix,
  } @ inputs: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    nixosConfigurations = let
      overlays = [(import ./overlays/spotify.nix) (import ./overlays/electron.nix)];
      system = "x86_64-linux";
    in {
      dev-machine = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          sops-nix.nixosModules.sops
          ./system
          home-manager.nixosModules.home-manager
          ./home
          ./modules
          {nixpkgs.overlays = overlays;}
          ({...}: {
            home-manager.sharedModules = [
              ({...}: {
                _module.args.inputs = inputs;
              })
            ];
          })
        ];
      };
    };
  };
}
