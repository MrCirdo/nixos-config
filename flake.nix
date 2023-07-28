{
  description = "My personal nixos config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";

    sops-nix.url = "github:Mic92/sops-nix";
    helix.url = "github:helix-editor/helix";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hyprland.url = "github:hyprwm/Hyprland";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    sops-nix,
    helix,
    nixos-hardware,
    nixos-generators,
    hyprland,
  } @ inputs: let
    overlays = [(import ./overlays/spotify.nix) (import ./overlays/electron.nix)];
    modules = [
      {nixpkgs.overlays = overlays;}
      sops-nix.nixosModules.sops
      home-manager.nixosModules.home-manager
      ./common
      ./modules
      {nixpkgs.overlays = overlays;}
      ({...}: {
        _module.args.inputs = inputs;
      })
      ({...}: {
        home-manager.sharedModules = [
          ({...}: {
            _module.args.inputs = inputs;
          })
        ];
      })
    ];
    system = "x86_64-linux";
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    packages.x86_64-linux = {
      kvm = nixos-generators.nixosGenerate {
        inherit modules;
        inherit system;
        format = "vm";
      };
    };
    nixosConfigurations = {
      peufpeuf = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = modules ++ [./machine/macbookpro nixos-hardware.nixosModules.apple-macbook-pro-12-1];
      };
      vroumvroum = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = modules ++ [./machine/xps9500 nixos-hardware.nixosModules.dell-xps-15-9500];
      };
    };
  };
}
