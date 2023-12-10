{
  config,
  lib,
  ...
}: let
  tailwindcss = config.theme.tailwindcss;
in {
  theme = lib.mkIf config.sway.enable {
    backgroundColor = tailwindcss.sky."100";
    backgroundColor2 = tailwindcss.sky."200";
    backgroundColor3 = tailwindcss.sky."300";

    focusColor = tailwindcss.sky."500";
    focusColor2 = tailwindcss.sky."400";
    focusColor3 = tailwindcss.sky."300";

    textColor = tailwindcss.sky."900";
    textColor2 = tailwindcss.sky."800";
    textColor3 = tailwindcss.sky."700";

    alertColor = tailwindcss.red."500";
  };
}
