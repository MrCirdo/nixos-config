# don't work :)
let
  versionCanary = "0.0.142";
  version = "0.0.21";
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
        sha256 = "18rmw979vg8lxxvagji6sim2s5yyfq91lfabsz1wzbniqfr98ci8";
      };

      buildInputs = (oldAttrs.buildInputs or []) ++ [self.makeWrapper];
      postFixup =
        oldAttrs.postFixup
        or ""
        + ''
          wrapProgram $out/bin/discord \
          --add-flags "--enable-features=UseOzonePlatform " \
          --add-flags "--ozone-platform=wayland" \
        '';
    });
  }
