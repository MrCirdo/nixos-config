{
  pkgs,
  lib,
  config,
  ...
}: let
  driveName = "GISTRE";
  conf = "${config.users.users.default.home}/.config/rclone/rclone.conf";
  path = "${config.users.users.default.home}/EPITA/";
in {
  systemd.services."rclone-epita-onedrive" = {
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    description = "Start the drive rclone of my personal onedrive";
    serviceConfig = {
      User = "root";
      ExecStart = ''${pkgs.rclone}/bin/rclone mount ${driveName}:/ ${path} --vfs-cache-mode full --config=${conf} --allow-other'';
    };
  };
  environment.systemPackages = [pkgs.rclone];
}
