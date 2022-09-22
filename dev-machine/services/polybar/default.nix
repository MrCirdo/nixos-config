{ pkgs, ... }:

let
  colors = {
    background = "#1e2029";
    foreground = "#f8f8f2";
    transparent = "#00000000";
    comment = "#6272a4";
    cyan = "#8be9fd";
    green = "#50fa7b";
    orange = "#ffb86c";
    pink = "#ff79c6";
    purple = "#bd93f9";
    red = "#ff5555";
    yellow = "#f1fa8c";
    black = "#000000";
  };
  fonts = {
    list = [
      "Ubuntu Nerd Font:size=10.5:style=Book;2"
      "Ubuntu Nerd Font Mono:style=Regular:size=13;3"
      "NotoSans Nerd Font:style=ExtraCondensed:size=20;5"
    ];

    text = 1;
    icons = 2;
    separators = 3;
  };

  config = import ./config.nix colors fonts;
  modules = import ./modules.nix pkgs colors fonts;
in {
  enable = false;

  package = pkgs.polybar.override {
    i3GapsSupport = true;
    alsaSupport = true;
  };

  script = ''
    if type "xrandr"; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar main &
      done
    else
      polybar main &
    fi
  '';
  settings = config // modules;

}
