{config, ...}: let
  configTheme = {config, ...}: let
    tailwindcss = config.theme.tailwindcss;
  in {
    theme = {
      backgroundColor = tailwindcss.gray."900";
      backgroundColor2 = tailwindcss.gray."800";
      backgroundColor3 = tailwindcss.gray."700";

      focusColor = tailwindcss.violet."500";
      focusColor2 = tailwindcss.violet."400";
      focusColor3 = tailwindcss.violet."300";

      textColor = tailwindcss.white;
      textColor2 = tailwindcss.gray."100";
      textColor3 = tailwindcss.gray."200";

      alertColor = tailwindcss.red."500";
    };
  };
in {
  home-manager = {
    sharedModules = [(import ../../themes) configTheme];
  };
}
