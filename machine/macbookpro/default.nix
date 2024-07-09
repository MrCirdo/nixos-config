{
  config,
  pkgs,
  ...
}: let
  zoneMinderStorageDir = "/zoneminder_images";
in {
  gnome.enable = false;
  sway.enable = true;

  networking.hostName = "Pipoune";
  services = {
    zoneminder = {
      enable = false;
      openFirewall = true;
      database = {
        createLocally = true;
        username = "zoneminder";
      };
      storageDir = "${zoneMinderStorageDir}";
    };

    tailscale.enable = true;
    pipewire = {
      rocSource = {
        enable = true;
        fecCode = "rs8m";
        sinkName = "Bonne grosse enceinte";
        openFirewall = true;
      };
    };
  };

  environment.systemPackages = [
    pkgs.fuse3
  ];

  systemd.services.rcloneZoneminder = {
    enable = false;
    wantedBy = ["multi-user.target"];
    after = ["network-online.target"];
    before = ["zoneminder.service"];
    description = "Mount zoneminder files";
    serviceConfig = {
      Type = "notify";
      ExecStartPre = "/run/current-system/sw/bin/mkdir -p ${zoneMinderStorageDir}";
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone  mount encrypted_backup: ${zoneMinderStorageDir} \
          --config=/home/odric/.config/rclone/rclone.conf \
          --vfs-cache-mode full \
          --umask 0000 \
          --allow-other \
          --buffer-size 512M
      '';
      ExecStop = "/run/wrappers/bin/umount ${zoneMinderStorageDir}";
      Environment = ["PATH=:/run/wrappers/bin:$PATH"];
    };
  };

  users.users.default = {
    extraGroups = ["zoneminder" "mysql" "video"];
  };
  home-manager.sharedModules = [
    ({lib, ...}: {
      services.spotifyd.enable = lib.mkForce true;
    })
  ];

  theme = let
    tailwindcss = config.theme.tailwindcss;
  in {
    backgroundColor = tailwindcss.indigo."950";
    backgroundColor2 = tailwindcss.indigo."900";
    backgroundColor3 = tailwindcss.indigo."800";

    focusColor = tailwindcss.indigo."500";
    focusColor2 = tailwindcss.indigo."400";
    focusColor3 = tailwindcss.indigo."300";

    textColor = tailwindcss.indigo."100";
    textColor2 = tailwindcss.indigo."200";
    textColor3 = tailwindcss.indigo."300";

    alertColor = tailwindcss.red."500";
    wallpaper = ../../wallpapers/jrmnt-wallheaven.png;
  };

  fileSystems."/home/odric/odricflix-hdd" = {
    device = "/dev/disk/by-uuid/3d7b351b-8407-4523-859e-5645caac3911";
    fsType = "ext4";
  };

  networking.firewall.allowedTCPPorts = [8096];

  imports = [./system];
}
