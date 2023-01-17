{
  pkgs,
  config,
  ...
}: let
  homeDirectory = config.home.homeDirectory;
  username = config.home.username;
  p10k = ./p10k.zsh;
in {
  programs.zsh = {
    enable = true;
    initExtra = ''
      if [[ -r "${homeDirectory}/.cache/p10k-instant-prompt-${username}.zsh" ]]; then
        source "${homeDirectory}/.cache/p10k-instant-prompt-${username}.zsh"
      fi

      set -o vi
      neofetch

      [[ ! -f ${p10k} ]] || source ${p10k}

      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    '';

    # Useful when the app use java gui.
    envExtra = ''
      _JAVA_AWT_WM_NONREPARENTING=1
    '';

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };
  };
}
