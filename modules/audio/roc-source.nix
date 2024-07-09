{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.services.pipewire.rocSource;
in {
  options.services.pipewire.rocSource = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = mdDoc ''
        Enable Roc pipewire module as sink.
      '';
    };

    localIp = mkOption {
      type = types.str;
      description = mkDoc ''
        The local ip using by roc to send the audio.
      '';
      example = "0.0.0.0";
      default = "0.0.0.0";
    };

    sourcePort = mkOption {
      type = types.port;
      description = mkDoc ''
        The port used by roc as source port.
      '';
      example = 10001;
      default = 10001;
    };

    repeairPort = mkOption {
      type = types.port;
      description = mkDoc ''
        The port used by roc as repair port.
      '';
      example = 10002;
      default = 10002;
    };

    fecCode = mkOption {
      type = types.enum ["disable" "rs8m" "ldpc"];
      description = mkDoc ''
        The fec code used by roc
      '';
      example = "rs8m";
      default = "disable";
    };

    sinkName = mkOption {
      type = types.str;
      description = mkDoc ''
        The name of sink.

        It appears in pavucontrol.
      '';
      example = "Roc Sink";
      default = "Roc Sink";
    };

    nodeName = mkOption {
      type = types.str;
      description = mkDoc ''
        The Name of node.
      '';

      example = "roc-source";
      default = "roc-source";
    };
    openFirewall = mkOption {
      type = types.bool;
      description = mkDoc ''
        Open Nixos firewall for repeairPort and sourcePort;
      '';
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = config.services.pipewire.enable;
        message = "Pipewire must be enabled.";
      }
    ];

    services.pipewire = {
      configPackages = [
        (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/roc-source.conf" ''
          context.modules = [
            {   name = libpipewire-module-roc-source
                args = {
                    fec.code = ${cfg.fecCode}
                    resampler.profile = medium
                    sess.latency.msec = 100
                    local.ip = ${cfg.localIp}
                    local.source.port = ${builtins.toString cfg.sourcePort}
                    local.repair.port = ${builtins.toString cfg.repeairPort}
                    sink.name = "${cfg.sinkName}"
                    sink.props = {
                       node.name = "${cfg.nodeName}"
                    }
                }
            }
          ]
        '')
      ];
    };

    networking.firewall = lib.mkIf cfg.openFirewall {
      allowedUDPPorts = [cfg.sourcePort cfg.repeairPort];
      allowedTCPPorts = [cfg.sourcePort cfg.repeairPort];
    };
  };
}
