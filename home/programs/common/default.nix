{ ... }:

{
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userEmail = "odricrouxparis@gmail.com";
      userName = "Odric Roux-Paris";
      signing = { key = "0x8EA8FD02F063AB8F"; };
    };

    gpg.enable = true;

    mako = {
      enable = true;
      backgroundColor = "#1E3A8A";
      borderColor = "#292524";
      defaultTimeout = 10000;
      borderRadius = 5;
    };

    ssh = {
      enable = true;
      serverAliveInterval = 1;
    };

    zsh = {
      enable = true;
      initExtraFirst = ''
        set -o vi
      '';

      # Useful when the app use java gui.
      envExtra = ''
        _JAVA_AWT_WM_NONREPARENTING=1  
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" ];
        theme = "robbyrussell";
      };
    };

    alacritty = {
      enable = true;
      settings = {
        key_bindings = [{
          key = "F11";
          action = "ToggleFullscreen";
        }];

        window = { opacity = 0.85; };
        font.size = 9;
      };
    };
  };

  imports = [ ./nvim ];
}
