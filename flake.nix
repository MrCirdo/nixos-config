{
  description = "My personal nixos config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";

    sops-nix.url = "github:Mic92/sops-nix";
    helix.url = "github:helix-editor/helix/24.07";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    grub2-themes.url = "github:/vinceliuice/grub2-themes/";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote.url = "github:nix-community/lanzaboote";

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
    nix-doom-emacs,
    emacs-overlay,
    nixpkgs-unstable,
    grub2-themes,
    lanzaboote,
  } @ inputs: let
    system = "x86_64-linux";

    overlays = [(import ./overlays/electron.nix) (import ./overlays/swaysome/swaysome.nix)];

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs = import nixpkgs {inherit system;};

    modules = [
      sops-nix.nixosModules.sops
      home-manager.nixosModules.home-manager
      grub2-themes.nixosModules.default
      ./modules/themes
      ./modules/audio
      ./common
      ./modules
      {nixpkgs.overlays = overlays;}
      ({config, ...}: {
        _module.args.inputs = inputs;
        _module.args.pkgs-unstable = pkgs-unstable;
        home-manager.extraSpecialArgs = {
          theme = config.theme;
        };
        home-manager.sharedModules = [
          ({...}: {
            _module.args.inputs = inputs;
            _module.args.pkgs-unstable = pkgs-unstable;
          })
        ];
      })
    ];
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    devShells.x86_64-linux = {
      htop = import ./shells/htop.nix {
        inherit pkgs;
        pkgs-unstable = pkgs-unstable;
      };
    };

    nixosConfigurations = {
      pipoune = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = modules ++ [./machine/macbookpro nixos-hardware.nixosModules.apple-macbook-pro-12-1];
      };

      groot = nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          modules
          ++ [
            ./machine/p16sgen2
            lanzaboote.nixosModules.lanzaboote
            nixos-hardware.nixosModules.lenovo-thinkpad-p16s-amd-gen2
          ];
      };
    };
  };
}
