{ ... }:

{
  programs = {
    mako = {
      enable = true;
      backgroundColor = "#3B82F6";
      borderColor = "#292524";
      defaultTimeout = 10000;
      borderRadius = 8;
    };
  };

  imports = [ ./waybar ];
}
