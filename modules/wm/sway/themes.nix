{
  config,
  lib,
  ...
}: let
  tailwindcss = config.theme.tailwindcss;
in {
  theme = lib.mkIf config.sway.enable {
    backgroundColor = tailwindcss.zinc."900";
    backgroundColor2 = tailwindcss.zinc."800";
    backgroundColor3 = tailwindcss.zinc."700";

    focusColor = tailwindcss.zinc."500";
    focusColor2 = tailwindcss.zinc."400";
    focusColor3 = tailwindcss.zinc."300";
    textColor = tailwindcss.white;
    textColor2 = tailwindcss.zinc."100";
    textColor3 = tailwindcss.zinc."200";

    alertColor = tailwindcss.red."500";
  };
}
