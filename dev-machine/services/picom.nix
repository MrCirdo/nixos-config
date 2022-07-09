{ ... }:

{
  enable = false;
  experimentalBackends = true;
  blur = true;
  extraOptions = ''
    corner-radius = 5.0;
  '';
  #extraOptions = ''
  #  corner-radius = 5.0;
  #  blur-method = "kawase";
  #  blur-strength = 10;
  #'';
}
