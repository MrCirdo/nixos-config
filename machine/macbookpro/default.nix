{config, ...}: {
  gnome.enable = false;
  sway.enable = true;

  networking.hostName = "Pipoune";

  services = {
    openssh.enable = true;
    zoneminder = {
      enable = true;
      openFirewall = true;
      database = {
        createLocally = true;
        username = "zoneminder";
      };
    };

    tailscale.enable = true;
  };

  users.users.default = {
    extraGroups = ["zoneminder" "mysql"];
  };

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
