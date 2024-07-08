{config, ...}: {
  sops = {
    defaultSopsFile = ./secrets/spotify.yaml;
    secrets = {
      spotify-password = {
        mode = "444";
        owner = config.users.users.default.name;
        group = config.users.users.default.group;
      };
    };
  };

  home-manager.sharedModules = [
    ({pkgs, ...}: {
      services = {
        spotifyd = {
          enable = false;
          settings = {
            global = {
              username = "Cirdo";
              password_cmd = "${pkgs.coreutils}/bin/cat ${config.sops.secrets.spotify-password.path}";
              backend = "pulseaudio";
              bitrate = 320;
              device_type = "speaker";
              device_name = "NixSauce";
            };
          };
        };
      };
    })
  ];
}
