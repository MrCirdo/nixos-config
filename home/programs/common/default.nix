{pkgs, ...}: {
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userEmail = "odricrouxparis@gmail.com";
      userName = "Odric Roux-Paris";
      signing = {key = "0x8EA8FD02F063AB8F";};
    };

    gpg.enable = true;

    ssh = {
      enable = true;
      serverAliveInterval = 1;
    };

    vscode = {
      enable = true;
      userSettings = {"keyboard.dispatch" = "keyCode";};
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        github.copilot
        eamodio.gitlens
        ms-python.python
        ms-vscode.cpptools
        jnoortheen.nix-ide
      ];
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
        plugins = ["git" "sudo"];
        theme = "robbyrussell";
      };
    };

    alacritty = {
      enable = true;
      settings = {
        key_bindings = [
          {
            key = "F11";
            action = "ToggleFullscreen";
          }
        ];

        window = {opacity = 0.85;};
        font.size = 9;
      };
    };
  };

  imports = [./nvim];
}
