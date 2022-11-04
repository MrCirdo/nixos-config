{pkgs, ...}: let
  launchSway =
    pkgs.writeShellScriptBin "launch_sway.sh"
    ''
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=sway
      export XDG_CURRENT_DESKTOP=sway
      export MOZ_ENABLE_WAYLAND=1
      export QT_QPA_PLATFORM=wayland
      export SDL_VIDEODRIVER=wayland
      export _JAVA_AWT_WM_NONREPARENTING=1

      ${pkgs.sway}/bin/sway
    '';
in {
  programs = {
    sway = {enable = true;};
    light.enable = true;
  };

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  security.polkit.enable = true;
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${launchSway}/bin/launch_sway.sh";
        user = "odric";
      };
      default_session = initial_session;
    };
  };
}
