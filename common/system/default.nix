{
  pkgs,
  config,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
      plugins = [pkgs.networkmanager-openconnect];
    };
  };

  time.timeZone = "Europe/Paris";

  boot = {
    kernel.sysctl = {
      "kernel.perf_event_paranoid" = 1;
    };
    plymouth = {
      enable = true;
      themePackages = [pkgs.adi1090x-plymouth-themes];
      theme = "darth_vader";
    };
  };

  i18n.defaultLocale = "en_US.utf8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.utf8";
    LC_IDENTIFICATION = "fr_FR.utf8";
    LC_MEASUREMENT = "fr_FR.utf8";
    LC_MONETARY = "fr_FR.utf8";
    LC_NAME = "fr_FR.utf8";
    LC_NUMERIC = "fr_FR.utf8";
    LC_PAPER = "fr_FR.utf8";
    LC_TELEPHONE = "fr_FR.utf8";
    LC_TIME = "fr_FR.utf8";
  };

  sops.age.keyFile = "${config.users.users.default.home}/.config/sops/age/keys.txt";
  services.printing.enable = true;

  hardware = {
    pulseaudio.enable = false;
    graphics.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  users.mutableUsers = true;
  users.users.default = {
    name = "odric";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "docker" "video" "fuse" "adbusers" "kvm" "libvirt" "qemu-libvirtd"];
    initialPassword = "root";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCsFzZ72Mtu3r5gtwQWa/M7jj9YS8BGUvyIc7rVTKZX/weH3eW7iGFlHNnnpnOHPu5AMgg8kojZ77NKyQzYYxkSIcAC6DaNvkoQf0QAfa1dgPT4OR5/0rd0ROlxUBjUgQSv9OHXbEq4idyU1VScxEVC5f6IovpPEWOxRmlXDUWFmoZ74DmNdKiRuxeiXfWtyDYUAp/UX16PolSkmJmQjHolB+CqrgKko1XzxqGN2ZajyHf+E8VxvmwEZS/DnFGvlu4/zyPF00PfSRSek7B2P0rmIPExACdYRB1jBP6FIU570qERzyGZ4/no0cGo3NhEupm6ykMeXaNabXQTxXes9lRpzGvmvHeT7MyGOAw79MH69IsYQnLaZCcmFwnXDnRFBOC23MaaXPwhRc7ZbLWleKYaFw4TOxtZNFbsZybIOXqTCx7Mkz2GIlAkSYVwMzh8ORIO22fGOTb8WxRSt2JEBLfozy7Dx0eentttgLFcnepj8sEtaon3saA0RIOW7VamGsz+xmsuOtkdGa9b/WFY9BMVuKbI30aiifQODnHE60bylqhooqAAX85aTKfqqT5Uulkjbt8K+TRhvCGVPmbl/6ACBJfqbQWcDQF/9/SOeLiknrN5rMkCSuOMbKuW4aNvXvorXXSq7XyEyCiGPyQ6SjrNSasJvVzgJnpWODZdY+QxYQ=="
    ];
  };

  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        "insecure-registries" = ["https://gitlab.quodfinancial.com:5050"];
        "features"."buildkit" = true;
      };
    };
    spiceUSBRedirection.enable = true;
    libvirtd.enable = true;
    lxd.enable = false;
  };

  environment = {
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
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

  system.stateVersion = "23.05"; # Did you read the comment?
  networking.nameservers = [
    "9.9.9.9"
    "149.112.112.112"
    "2620:fe::fe"
    "2620:fe::9"
  ];

  powerManagement.enable = true;

  imports = [./services ./programs];
}
