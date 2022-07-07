{ ... }:

{
  enable = true;
  settings = {
    key_bindings = [
      { key = "F11"; action = "ToggleFullscreen"; }
    ];

    window = {
      # opacity = 0.85;
      padding = { x = 5; };
      colors = {
        # Default colors
        primary = {
          background = "#282c34";
          foreground = "#abb2bf";
        };

        # Normal colors
        normal = {
          # NOTE =  Use "#131613" for the `black` color if you"d like to see
          # black text on the background.
          black = "#282c34";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#abb2bf";
        };

        # Bright colors
        bright = {
          black = "#5c6370";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#ffffff";
        };
      };
    };
  };
}
