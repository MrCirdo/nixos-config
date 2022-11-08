{pkgs, ...}: {
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userEmail = "odricrouxparis@gmail.com";
      userName = "Odric Roux-Paris";
      signing = {key = "0xCFB01BFD5F9F7922";};
    };

    ssh = {
      enable = true;
      serverAliveInterval = 1;
    };

    vscode = {
      enable = true;
      userSettings = {"keyboard.dispatch" = "keyCode";};
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
        neofetch
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
        font = {
          size = 9;
          normal = {
            family = "Source CodePro";
            style = "Regular";
          };

          bold = {
            family = "Source CodePro";
            style = "Bold";
          };

          italic = {
            family = "Source CodePro";
            style = "Italic";
          };

          bold_italic = {
            family = "Source CodePro";
            style = "Bold Italic";
          };
        };
      };
    };
    gitui = {
      enable = true;
      keyConfig = ''
        (
          focus_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
          focus_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
          focus_above: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
          focus_below: Some(( code: Char('j'), modifiers: ( bits: 0,),)),

          open_help: Some(( code: F(1), modifiers: ( bits: 0,),)),

          move_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
          move_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
          move_up: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
          move_down: Some(( code: Char('j'), modifiers: ( bits: 0,),)),
          popup_up: Some(( code: Char('p'), modifiers: ( bits: 2,),)),
          popup_down: Some(( code: Char('n'), modifiers: ( bits: 2,),)),
          page_up: Some(( code: Char('b'), modifiers: ( bits: 2,),)),
          page_down: Some(( code: Char('f'), modifiers: ( bits: 2,),)),
          home: Some(( code: Char('g'), modifiers: ( bits: 0,),)),
          end: Some(( code: Char('G'), modifiers: ( bits: 1,),)),
          shift_up: Some(( code: Char('K'), modifiers: ( bits: 1,),)),
          shift_down: Some(( code: Char('J'), modifiers: ( bits: 1,),)),

          edit_file: Some(( code: Char('I'), modifiers: ( bits: 1,),)),

          status_reset_item: Some(( code: Char('U'), modifiers: ( bits: 1,),)),

          diff_reset_lines: Some(( code: Char('u'), modifiers: ( bits: 0,),)),
          diff_stage_lines: Some(( code: Char('s'), modifiers: ( bits: 0,),)),

          stashing_save: Some(( code: Char('w'), modifiers: ( bits: 0,),)),
          stashing_toggle_index: Some(( code: Char('m'), modifiers: ( bits: 0,),)),

          stash_open: Some(( code: Char('l'), modifiers: ( bits: 0,),)),

          abort_merge: Some(( code: Char('M'), modifiers: ( bits: 1,),)),
          )
      '';
    };
  };
  imports = [./nvim];
}
