{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.services.pipewire.rocSink;
in {
  options.services.pipewire.rocSink = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = mdDoc ''
        Enable Roc pipewire module as sink.
      '';
    };

    remoteIp = mkOption {
      type = types.str;
      description = mkDoc ''
        The remote ip using by roc to send the audio.
      '';
      example = "190.168.1.23";
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

      example = "roc-sink";
      default = "roc-sink";
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
        (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/roc-sink.conf" ''
          context.modules = [
            {   name = libpipewire-module-roc-sink
                args = {
                    fec.code = ${cfg.fecCode}
                    remote.ip = ${cfg.remoteIp}
                    remote.source.port = ${builtins.toString cfg.sourcePort}
                    remote.repair.port = ${builtins.toString cfg.repeairPort}
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
