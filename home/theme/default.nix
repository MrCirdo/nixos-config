{config, ...}: let
  configTheme = {config, ...}: let
    tailwindcss = config.theme.tailwindcss;
  in {
    theme = {
      backgroundColor = tailwindcss.neutral."900";
      focusColor = tailwindcss.violet."500";
    };
  };
in {
  home-manager = {
    sharedModules = [(import ../../themes) configTheme];
  };
}
