{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    hyprland = {
      enable = lib.mkEnableOption "Enable Hyprland";
    };
  };

  config = let
    launchHyprland =
      pkgs.writeShellScriptBin "launch_hyprland.sh"
      ''
          export XDG_SESSION_TYPE=wayland
          export XDG_CURRENT_DESKTOP=Hyprland
          export MOZ_ENABLE_WAYLAND=1
          export QT_QPA_PLATFORM=wayland
          export SDL_VIDEODRIVER=wayland
          export _JAVA_AWT_WM_NONREPARENTING=1

        Hyprland
      '';
  in
    with lib;
      mkMerge [
        {
          home-manager.sharedModules = [
            {
              options.hyprland.enable = lib.mkEnableOption "Enable Hyprland into Home-Manager";
            }
          ];
        }
        (mkIf config.hyprland.enable {
          programs.light.enable = true;

          services.xserver.displayManager.gdm = {
            enable = true;
            wayland = true;
          };

          security.polkit.enable = true;
          services.dbus.enable = true;
          services.greetd = {
            enable = true;
            settings = rec {
              initial_session = {
                command = "${launchHyprland}/bin/launch_hyprland.sh";
                user = config.users.users.default.name;
              };
              default_session = initial_session;
            };
          };

          home-manager.sharedModules = let
            hyprlandEnable = config.hyprland.enable;
          in [
            inputs.hyprland.homeManagerModules.default
            {hyprland.enable = hyprlandEnable;}
            {home.packages = [inputs.hyprland.packages."x86_64-linux".xdg-desktop-portal-hyprland];}
          ];
        })
      ];

  imports = [./config.nix ./packages ./programs ./services ./themes.nix];
}
