{config, ...}: let
  configTheme = {config, ...}: let
    tailwindcss = config.theme.tailwindcss;
  in {
    theme = {
      wallpaper = ./wallpaper/moon-tl.jpg;

      backgroundColor = tailwindcss.gray."900";
      backgroundColor2 = tailwindcss.gray."800";
      backgroundColor3 = tailwindcss.gray."700";

      focusColor = tailwindcss.orange."500";
      focusColor2 = tailwindcss.orange."400";
      focusColor3 = tailwindcss.orange."300";
      textColor = tailwindcss.white;
      textColor2 = tailwindcss.gray."100";
      textColor3 = tailwindcss.gray."200";

      alertColor = tailwindcss.red."500";
    };
  };
in {
  home-manager = {
    sharedModules = [(import ../../../modules/themes) configTheme];
  };
}
