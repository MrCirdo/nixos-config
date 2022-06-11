{ ... }:

{
  enable = true;
  defaultKeymap = "vicmd";
  initExtraFirst = "set -o vi\n";
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" ];
    theme = "robbyrussell";
  };
}
