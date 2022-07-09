{ ... }:

{
  enable = true;
  initExtraFirst = ''
    set -o vi
  '';
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" ];
    theme = "robbyrussell";
  };
}
