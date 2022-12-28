{
  description = "My personal nixos config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    nixosConfigurations = let
      overlays = [(import ./overlays/spotify.nix) (import ./overlays/electron.nix)];
    in {
      dev-machine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system
          home-manager.nixosModules.home-manager
          ./home
          ./wayland
          {nixpkgs.overlays = overlays;}
        ];
      };
    };
  };
}
