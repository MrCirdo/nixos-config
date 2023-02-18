{
  description = "My personal nixos config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    helix.url = "github:helix-editor/helix";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

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
  } @ inputs: let
    modules = [
      sops-nix.nixosModules.sops
      home-manager.nixosModules.home-manager
      ./system
      ./home
      ./modules
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
        modules = modules ++ [./system/macbookpro nixos-hardware.nixosModules.apple-macbook-pro-12-1];
      };
      vroumvroum = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = modules ++ [./system/xps9500 nixos-hardware.nixosModules.dell-xps-15-9500];
      };
    };
  };
}
