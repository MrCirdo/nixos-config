{
  pkgs,
  config,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
    };
  };

  time.timeZone = "Europe/Paris";

  boot = {
    plymouth = {
      enable = true;
      themePackages = [pkgs.adi1090x-plymouth-themes];
      theme = "cross_hud";
    };

    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };

  sops.age.keyFile = "${config.users.users.default.home}/.config/sops/age/keys.txt";
  services.printing.enable = true;

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo-rs.enable = true;
  };

  users.mutableUsers = true;
  users.users.default = {
    name = "odric";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "docker" "video" "fuse" "adbusers" "kvm" "libvirt" "qemu-libvirtd"];
    initialPassword = "root";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDuLEzi7AmXXlmVe1/E2lGjlgmr86ovQj6XUg5/3ZCmVoffL1ukX+GU6GKGanh3WlG8yM1YulDFfGM2srF0j5bNkEx8sWGEdRh2pcJQnIZREEAk1JdAXU3UQKhIPjiVLoF4yxIsedGke+YukZuFomQUHQ+ljV0X6dgcfK1Dz/kCbP39da6+QNfMhM6xzGfwzJRzm8U+7fFyzsfbfwnDvLfWfLL34l1LGej4nKzpegjggtNrNqNvsWYUYQ8fwty2DeJV/stRZa39K6UggaMWQWgD38yE6q4XhtCw6zCAq7SFBlihJ2XGMdodbDqazlqIX+vUHHdJQAYrfrAd4QNoVNO8DaaAhrpM1mgM4HEW/BlaZcR8DYROaHhjw+Ye3lS9v/gMjkJCUFVzVtoph5fFG27eQfTzLsxDMiLkj5zLGNqkx7vXqXGg94k9ccfcg7QamfvNstSoRVxK9HGMjH7IyXJrk1BoOXm2TBjwerb7d6XIs66gUv/Sut9+/uEpt8Eg0wX01mbYXQUQFfkiQhUWGHB/sPEpJRYiwSvxCVkQz85wGgum/qI4yJlg0kH+ylrMPbYr7Wv7B69xqhVfABSxXJiDxQ0zcgW7T8E7G2DwrgujJrdLI/tJt0kFL0QTfufPXMTWZEnbVuWbT5gYefd3JAVM2Ys08yMuod309lKPGOcbUQ=="
    ];
  };

  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        "features"."buildkit" = true;
      };
    };
    spiceUSBRedirection.enable = true;
    libvirtd.enable = true;
    lxd.enable = false;
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      extra-substituters = ["https://helix.cachix.org" "https://nixpkgs-wayland.cachix.org"];
      extra-trusted-public-keys = ["helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs=" "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "nix-2.15.3"
    ];
  };

  system.stateVersion = "24.11"; # Did you read the comment?
  networking.nameservers = [
    "dns.mullvad.net"
  ];

  powerManagement.enable = true;

  imports = [./services ./programs];
}
