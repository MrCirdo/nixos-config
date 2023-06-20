{
  config,
  lib,
  ...
}: let
  tailwindcss = config.theme.tailwindcss;
in {
  theme = lib.mkIf config.sway.enable {
    backgroundColor = tailwindcss.gray."900";
    backgroundColor2 = tailwindcss.gray."800";
    backgroundColor3 = tailwindcss.gray."700";

    focusColor = tailwindcss.lime."500";
    focusColor2 = tailwindcss.lime."400";
    focusColor3 = tailwindcss.lime."300";
    textColor = tailwindcss.white;
    textColor2 = tailwindcss.gray."100";
    textColor3 = tailwindcss.gray."200";

    alertColor = tailwindcss.red."500";
  };
}
