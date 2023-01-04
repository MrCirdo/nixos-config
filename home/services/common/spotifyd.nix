{config, ...}: {
  sops = {
    defaultSopsFile = ./secrets/spotify.yaml;
    secrets.spotify-password.mode = "444";
  };

  home-manager.sharedModules = [
    ({pkgs, ...}: {
      services = {
        spotifyd = {
          enable = true;
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
