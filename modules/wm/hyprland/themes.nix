{
  config,
  lib,
  ...
}: let
  tailwindcss = config.theme.tailwindcss;
in {
  theme = lib.mkIf config.hyprland.enable {
    backgroundColor = tailwindcss.zinc."900";
    backgroundColor2 = tailwindcss.zinc."800";
    backgroundColor3 = tailwindcss.zinc."700";

    focusColor = tailwindcss.yellow."500";
    focusColor2 = tailwindcss.yellow."400";
    focusColor3 = tailwindcss.yellow."300";
    textColor = tailwindcss.white;
    textColor2 = tailwindcss.gray."100";
    textColor3 = tailwindcss.gray."200";

    alertColor = tailwindcss.red."500";
  };
}
