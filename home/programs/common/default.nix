{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userEmail = "odricrouxparis@gmail.com";
      userName = "Odric Roux-Paris";
      signing = {key = "C608DE9D03A3BCDB75A51D12DD79BAE7510108AC";};
    };

    ssh = {
      enable = true;
      serverAliveInterval = 10;
      extraConfig = ''
        TCPKeepAlive yes
      '';
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

    helix = {
      enable = true;
      package = inputs.helix.packages.${pkgs.system}.default;
      settings = {
        theme = "onedark";
        editor.cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };

    newsboat = {
      enable = true;
      extraConfig = ''
        unbind-key UP
        bind-key k up

        unbind-key DOWN
        bind-key j down

        color background          white    black
        color listnormal          white    black
        color listfocus           white    color63   bold
        color listnormal_unread   magenta  black
        color listfocus_unread    magenta  color63   bold
        color title               white    color63   bold
        color info                white    default   bold
        color hint-key            white    default   bold
        color hint-keys-delimiter white    default
        color hint-separator      white    default   bold
        color hint-description    white    default   bold
        color article             white    black
      '';
      urls = [
        {
          title = "Korben";
          tags = ["Tech"];
          url = "https://korben.info/rss";
        }

        {
          title = "RedHat";
          tags = ["Linux" "Tech"];
          url = "https://redhat.com/en/rss/blog";
        }
        {
          title = "Linux Embedded";
          tags = ["Linux" "Tech"];
          url = "https://www.linuxembedded.fr/rss";
        }
        {
          title = "Digital Ocean";
          tags = ["Cloud" "Tech" "Linux"];
          url = "https://www.digitalocean.com/blog/rss";
        }
        {
          title = "Drew DeVault's blog";
          tags = ["Personal" "Tech"];
          url = "https://drewdevault.com/blog/index.xml";
        }
        {
          title = "Embedded";
          tags = ["Embedded"];
          url = "https://www.embedded.com/rss";
        }
        {
          title = "Lwn";
          tags = ["Linux" "Kernel"];
          url = "https://lwn.net/headlines/newrss";
        }
      ];
    };

    gpg = {
      enable = true;
      settings = {
        auto-key-locate = ["cert" "pka" "dane" "wkd" "keyserver"];
        auto-key-retrieve = true;
      };
    };
  };

  imports = [./nvim ./zsh];
}
