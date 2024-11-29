{
  inputs,
  pkgs,
  pkgs-unstable,
  config,
  theme,
  ...
}: {
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      lfs.enable = true;
      userEmail = "odric@roux-paris.fr";
      userName = "Odric Roux-Paris";
      signing = {
        key = "C608DE9D03A3BCDB75A51D12DD79BAE7510108AC";
        signByDefault = true;
      };
      difftastic = {
        enable = false;
        background = "dark";
      };

      delta = {enable = true;};
      extraConfig = {
        push = {
          autoSetupRemote = true;
        };
        pull = {
          rebase = true;
        };
        rerere = {
          enable = true;
          autoUpdate = true;
        };
      };
    };

    bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        set -o vi
      '';
    };

    ssh = {
      enable = true;
      serverAliveInterval = 10;
      forwardAgent = true;
      extraConfig = ''
        TCPKeepAlive yes
      '';
    };

    vscode = {
      enable = true;
      package = pkgs-unstable.vscodium;
      userSettings = {
        "keyboard.dispatch" = "keyCode";
        "editor.largeFileOptimizations" = true;
        "window.titleBarStyle" = "custom";
        "workbench.colorTheme" = "Ayu Dark";
        "vscode-neovim.neovimExecutablePaths.linux" = "${pkgs.neovim}/bin/nvim";
        "C_Cpp.intelliSenseEngine" = "disabled";
        "rust-analyzer.server.path" = "/etc/profiles/per-user/odric/bin/rust-analyzer";
        "vim.handleKeys" = {
          "<C-d>" = true;
          "<C-s>" = false;
          "<C-z>" = false;
          "<C-p>" = false;
        };
        "editor.tokenColorCustomizations" = {
          "textMateRules" = [
            {
              "name" = "One Dark italic";
              "scope" = [
                "comment"
                "entity.other.attribute-name"
                "keyword"
                "markup.underline.link"
                "storage.modifier"
                "storage.type"
                "string.url"
                "variable.language.super"
                "variable.language.this"
              ];

              "settings" = {
                "fontStyle" = "italic";
              };
            }
            {
              "name" = "One Dark italic reset";
              "scope" = [
                "keyword.operator"
                "keyword.other.type"
                "storage.modifier.import"
                "storage.modifier.package"
                "storage.type.built-in"
                "storage.type.function.arrow"
                "storage.type.generic"
                "storage.type.java"
                "storage.type.primitive"
              ];

              "settings" = {
                "fontStyle" = "";
              };
            }
          ];
        };
      };

      extensions = with pkgs-unstable.vscode-extensions; [
        eamodio.gitlens
        jnoortheen.nix-ide
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cmake-tools
        mskelton.one-dark-theme
        rust-lang.rust-analyzer
        teabyii.ayu
        twxs.cmake
        vadimcn.vscode-lldb
        vscodevim.vim
      ];
    };

    alacritty = {
      enable = true;
      settings = {
        env = {
          TERM = "xterm-256color";
        };

        window = {opacity = 0.75;};
        colors = {
          primary = {
            background = theme.backgroundColor;
            foreground = theme.textColor;
          };
        };

        font = {
          size = 11;
          offset = {
            x = 0;
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
        theme = "sonokai";
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
          title = "Drew DeVault's blog";
          tags = ["Personal" "Tech"];
          url = "https://drewdevault.com/blog/index.xml";
        }
        {
          title = "Lwn";
          tags = ["Linux" "Kernel"];
          url = "https://lwn.net/headlines/newrss";
        }
        {
          title = "ISO Cpp";
          tags = ["Tech" "C++"];
          url = "https://isocpp.org/blog/rss";
        }
        {
          title = "Linux.com";
          tags = ["Linux"];
          url = "https://www.linux.com/rss";
        }
        {
          title = "Oracle Linux";
          tags = ["Linux"];
          url = "https://blogs.oracle.com/linux/rss";
        }
        {
          title = "Phoronix";
          tags = ["Linux"];
          url = "https://www.phoronix.com/rss.php";
        }
        {
          title = "ArchLinux";
          tags = ["Linux"];
          url = "https://archlinux.org/feeds/news/";
        }
        {
          title = "Nixos";
          tags = ["Linux"];
          url = "https://nixos.org/blog/feed.xml";
        }
        {
          title = "Neovim";
          tags = ["Tech"];
          url = "https://neovim.io/news.xml";
        }
        {
          title = "Hacker News";
          tags = ["Tech"];
          url = "https://news.ycombinator.com/rss";
        }
      ];
    };

    gpg = {
      enable = true;
      settings = {
        auto-key-locate = ["cert" "pka" "dane" "wkd" "keyserver"];
        auto-key-retrieve = true;
      };
      publicKeys = [
        {
          source = pkgs.fetchurl {
            url = "https://github.com/MrCirdo.gpg";
            hash = "sha256-VcMM8wf+1zPExshINV/RLRUjN/LhulncP7OfJmtgKzM=";
          };
          trust = "ultimate";
        }
      ];
    };

    tmux = {
      enable = true;
      mouse = true;
      keyMode = "vi";
    };
  };

  imports = [./zsh];
}
