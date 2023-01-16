# don't work :)
let
  versionCanary = "0.0.142";
  version = "0.0.24";
in
  self: super: {
    discord-canary = super.discord-canary.overrideAttrs (oldAttrs: {
      src = builtins.fetchurl {
        url = "https://dl-canary.discordapp.net/apps/linux/${versionCanary}/discord-canary-${versionCanary}.tar.gz";
        sha256 = "fc45890b7845201ab01daf73e2731647b0a9a1aa9863ea6fc3ed6f72ae05d0b5";
      };

      buildInputs = (oldAttrs.buildInputs or []) ++ [self.makeWrapper];
      installPhase =
        oldAttrs.installPhase
        or ""
        + ''
          # Create required symlinks:
           ln -s libGLESv2.so $out/lib/discordcanary/libGLESv2.so.2
        '';
    });

    discord = super.discord.overrideAttrs (oldAttrs: {
      src = builtins.fetchurl {
        url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
        sha256 = "486fb7e1fb74993aad83dac5888eb437a24838dcaa17c73c4a59d1727e5ae177";
      };

      buildInputs = (oldAttrs.buildInputs or []) ++ [self.makeWrapper];
      postFixup =
        oldAttrs.postFixup
        or ""
        + ''
          wrapProgram $out/bin/discord \
          --add-flags "--ignore-gpu-blocklist " \
          --add-flags "--disable-features=UseOzonePlatform " \
          --add-flags "--enable-features=VaapiVideoDecoder " \
          --add-flags "--use-gl=desktop " \
          --add-flags "--enable-gpu-rasterization " \
          --add-flags "--enable-zero-copy"
        '';
    });
  }
