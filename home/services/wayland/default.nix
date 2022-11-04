{...}: {
  services = {
    gammastep = {
      enable = true;
      dawnTime = "8:00";
      duskTime = "22:00";
      temperature.night = 2500;
    };
  };
}
