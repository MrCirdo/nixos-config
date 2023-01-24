{
  description = "My personal nixos config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    helix.url = "github:helix-editor/helix";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    sops-nix,
    helix,
    nixos-hardware,
  } @ inputs: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    nixosConfigurations = let
      overlays = [(import ./overlays/discord.nix)];
      system = "x86_64-linux";
    in {
      dev-machine = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          nixos-hardware.nixosModules.apple-macbook-pro-12-1
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
