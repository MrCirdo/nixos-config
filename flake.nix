{
  description = "My personal nixos config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-wayland = { url = "github:nix-community/nixpkgs-wayland"; };
    nixpkgs-wayland.inputs.master.follows = "master";
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-wayland, ... }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;

    nixosConfigurations = let
      overlays =
        [ (import ./overlays/spotify.nix) (import ./overlays/electron.nix) ];
    in {
      dev-machine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system
          home-manager.nixosModules.home-manager
          ./home
          ./wayland
          { nixpkgs.overlays = [ nixpkgs-wayland.overlay ] ++ overlays; }
        ];
      };
    };
  };
}
