let version = "0.0.142";
in self: super: {
  discord-canary = super.discord-canary.overrideAttrs (oldAttrs: {
    src = builtins.fetchurl {
      url =
        "https://dl-canary.discordapp.net/apps/linux/${version}/discord-canary-${version}.tar.gz";
      sha256 =
        "fc45890b7845201ab01daf73e2731647b0a9a1aa9863ea6fc3ed6f72ae05d0b5";
    };

    buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ self.makeWrapper ];
    postFixup = oldAttrs.postFixup or "" + ''
      wrapProgram $out/bin/discordcanary \
      --add-flags "--ignore-gpu-blocklist" \
      --add-flags "--enable-features=VaapiVideoDecoder" \
      --add-flags "--enable-features=UseOzonePlatform " \
      --add-flags "--ozone-platform=wayland" \
      --add-flags "--enable-gpu-rasterization" \
      --add-flags "--enable-zero-copy"
    '';
  });
}
