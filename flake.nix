{
  description = "My personal nixos config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";

    sops-nix.url = "github:Mic92/sops-nix";
    helix.url = "github:helix-editor/helix/23.10";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hyprland.url = "github:hyprwm/Hyprland";

    grub2-themes.url = "github:/vinceliuice/grub2-themes/";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
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
    nix-doom-emacs,
    emacs-overlay,
    nixpkgs-unstable,
    grub2-themes,
  } @ inputs: let
    system = "x86_64-linux";

    overlays = [(import ./overlays/electron.nix)];

    nixpkgsUnstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    modules = [
      sops-nix.nixosModules.sops
      home-manager.nixosModules.home-manager
      grub2-themes.nixosModules.default
      ./common
      ./modules
      {nixpkgs.overlays = overlays;}
      ({...}: {
        _module.args.inputs = inputs;
        _module.args.pkgs-unstable = nixpkgsUnstable;
        home-manager.sharedModules = [
          ({...}: {
            _module.args.inputs = inputs;
            _module.args.pkgs-unstable = nixpkgsUnstable;
          })
        ];
      })
    ];
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
      vroumvroooumm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = modules ++ [./machine/p16sgen2];
      };
    };
  };
}
