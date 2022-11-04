# From https://gist.github.com/Strum355/8e0c63d662f297ce23654e763bd4c6af
self: let
  enableWayland = drv: bin:
    drv.overrideAttrs (old: {
      nativeBuildInputs =
        (old.nativeBuildInputs or [])
        ++ [self.makeWrapper];
      postFixup =
        (old.postFixup or "")
        + ''
          wrapProgram $out/bin/${bin} \
          --add-flags "--enable-features=UseOzonePlatform \
          --ozone-platform=wayland"
        '';
    });
in
  super: {
    vscode = enableWayland super.vscode "code";
    signal-desktop = enableWayland super.signal-desktop "signal-desktop";
    bitwarden = enableWayland super.bitwarden "bitwarden";
  }
